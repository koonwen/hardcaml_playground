[@@@warning "-32"]
open Lib
open Base
open Hardcaml
open Signal

(* to_int interprets a value as an unsigned integer value *)
(* to_sint will treat the value as a signed, two's complement integer *)

let x = of_string "101"
let y = of_string "010"
let lst = [ x; y ];;
mux (of_int ~width:1 1) lst |> to_string;;
select (of_string "110011") 2 0 |> to_string

let simple_circuit =
  let i = Signal.input "I" 1 in
  let o = Signal.output "O" i in
Circuit.create_exn ~name:"simple" [ o ];;

(* Addition between two unsigned 4 bit integers *)
let adder4bit_circuit =
  let open Signal in
  (* the integer value is the width of the input *)
  let a = Signal.input "a" 4 in
  let b = Signal.input "b" 4 in
  let res = Signal.output "res" (a +: b) in
  Circuit.create_exn ~name:"4bitadder" [ res ]

let priority_select_circuit =
  let a = Signal.input "a" 24 in
  let cases =
    List.init 24 ~f:(fun i -> { valid = bit a i; value = of_int ~width:5 i } : int -> (t, t) Comb.with_valid2)
    |> List.rev
  in
  let encoder = priority_select_with_default ~default:(of_string "00000") cases in
  let res = Signal.output "res" encoder in
  Circuit.create_exn ~name:"priority_encoder_other" [ res ]

let () =
  List.iter ~f:(Hardcaml.Rtl.output Vhdl)
    (List.concat [ Adder.circuits; Int_to_ieee_float.circuits; [ priority_select_circuit ] ])

