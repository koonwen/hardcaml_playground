open Lib
open Hardcaml

exception Test_failed of string
let test_failed fmt = Printf.ksprintf (fun e -> raise (Test_failed e)) fmt

(* let printf = Printf.printf *)

let adder_cases = [ 0, 0, 0; 0, 1, 1; 1, 0, 1; 1, 1, 0 ]

let adder_testbench =
  let simulator = Cyclesim.create Adder.one_bit_adder in
  let a = Cyclesim.in_port simulator "a" in
  let b = Cyclesim.in_port simulator "b" in
  let c = Cyclesim.out_port simulator "c" in
  let open Base in
  List.iter
    ~f:(fun (a_, b_, c_) ->
      a := Bits.of_int ~width:(Bits.width !a) a_;
      b := Bits.of_int ~width:(Bits.width !b) b_;
      let expected = Bits.of_int ~width:(Bits.width !c) c_ in
      Cyclesim.reset simulator;
      Cyclesim.cycle simulator;
      match Bits.equal expected !c with
      | true -> ()
      | false ->
        test_failed "for a: %s, b:%s expected %s but got %s" (Bits.to_string !a) (Bits.to_string !b)
          (Bits.to_string expected) (Bits.to_string !c))
    adder_cases

let prioirty_cases =
  let priority_width = 8 in
  let input_width = 24 in
  let create_case i =
    let open Base in
    let i_inv = input_width - i - 1 in
    let i = i in
    let signal = Bits.random ~width:input_width |> Bits.to_string |> Signal.of_string in
    let zeroed_leading =
      signal
      |> Signal.bits_msb
      |> List.mapi ~f:(fun inner s -> if i < inner then Signal.gnd else if i = inner then Signal.vdd else s)
      |> Signal.concat_msb
      |> Signal.to_bstr
      |> Bits.of_string
    in
    Bits.of_int ~width:priority_width i_inv, zeroed_leading
  in
  let open Base in
  List.init input_width ~f:create_case

let priority_encoder_testbench =
  let sim = Cyclesim.create Int_to_ieee_float.priority_encoder in
  let a = Cyclesim.in_port sim "a" in
  let priority = Cyclesim.out_port sim "priority" in
  let open Base in
  List.iter
    ~f:(fun (expected, a_) ->
      a := a_;
      Cyclesim.reset sim;
      Cyclesim.cycle sim;
      match Bits.equal expected !priority with
      | true -> ()
      | false ->
        test_failed "for a: %s [%d], expected %s [%d] but got %s [%d]" (Bits.to_string !a) (Bits.to_int !a)
          (Bits.to_string expected) (Bits.to_int expected) (Bits.to_string !priority) (Bits.to_int !priority))
    prioirty_cases

let int_to_float_cases =
  let a_width = 24
  and b_width = 32 in
  let make_int_and_float i =
    Bits.of_int ~width:a_width i, i |> float_of_int |> Int32.bits_of_float |> Bits.of_int32 ~width:b_width
  in
  List.concat
    [
      List.map make_int_and_float [ 0; -1; 1 ];
      List.init 100 (fun _ -> make_int_and_float @@ if Random.int 50 > 24 then Random.int 100 else ~-1 * Random.int 100);
    ]

let int_to_float_testbench =
  let sim = Cyclesim.create Int_to_ieee_float.int_to_float_inline in
  let a = Cyclesim.in_port sim "a" in
  let b = Cyclesim.out_port sim "b" in
  let open Base in
  List.iter
    ~f:(fun (a_, expected) ->
      a := a_;
      Cyclesim.reset sim;
      Cyclesim.cycle sim;
      match Bits.equal expected !b with
      | true -> ()
      | false ->
        test_failed "for a: %s [%d], expected %s [%f] but got %s [%f]" (Bits.to_string !a) (!a |> Bits.to_sint)
          (Bits.to_string expected)
          (expected |> Bits.to_int32 |> Int32.float_of_bits)
          (Bits.to_string !b)
          (!b |> Bits.to_int32 |> Int32.float_of_bits))
    int_to_float_cases

let () =
  adder_testbench;
  priority_encoder_testbench;
  int_to_float_testbench
