open Lib
open Hardcaml

exception Test_failed of string
let test_failed fmt = Printf.ksprintf (fun e -> raise (Test_failed e)) fmt

let adder_cases = [ 0, 0, 0; 0, 1, 1; 1, 0, 1; 1, 1, 0 ]

let adder_testbench =
  let simulator = Cyclesim.create Adder.one_bit_adder in
  let a = Cyclesim.in_port simulator "a" in
  let b = Cyclesim.in_port simulator "b" in
  let c = Cyclesim.out_port simulator "c" in
  List.iter
    (fun (a_, b_, c_) ->
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

let () = adder_testbench
