open Base
open Hardcaml
open Signal

let itof =
  let i24 = input "I" 24 in
  let sign = msb i24 in
  let magnitude = ~:(lsbs i24) +: (of_int ~width:23 1) in
  let cases = List.init 23
      ~f:(fun i -> {valid = bit magnitude i; value = of_int ~width:8 i}
                   : int ->  (t,t) Comb.with_valid2) |> List.rev in
  let position = priority_select_with_default ~default:(zero 8) cases in
  let exponent = position +: (of_int ~width:8 127) in
  let mantissa =
    let lst = List.init 24 ~f:(fun i -> sll magnitude i) in
    mux position lst in
  let float = concat_msb [sign; exponent; mantissa] in
  let zero_case : (t,t) Comb.with_valid2 list = [{valid = (i24 ==: zero 24) ; value =  zero 32}] in
  let o = output "O" (priority_select_with_default ~default:float zero_case) in
  Circuit.create_exn ~name:"itof" [ o ]

exception Test_failed of string
let test_failed fmt = Printf.ksprintf (fun e -> raise (Test_failed e)) fmt

let int_to_float_cases =
  let a_width = 24
  and b_width = 32 in
  let make_int_and_float i =
    Bits.of_int ~width:a_width i, i |> Caml.float_of_int |> Int32.bits_of_float |> Bits.of_int32 ~width:b_width
  in
  List.concat
    [
      Caml.List.map make_int_and_float [ 0; -1; 1 ];
      Caml.List.init 100 (fun _ -> make_int_and_float @@ if Random.int 50 > 24 then Random.int 100 else ~-1 * Random.int 100);
    ]

let int_to_float_testbench =
  let sim = Cyclesim.create itof in
  let a = Cyclesim.in_port sim "I" in
  let b = Cyclesim.out_port sim "O" in
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


let () = int_to_float_testbench
