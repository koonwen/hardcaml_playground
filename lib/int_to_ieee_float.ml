open Hardcaml
open Hardcaml.Signal

let printf = Printf.printf

open Base

let de_2s_comp a = mux2 (msb a) (List.map ~f:Signal.( ~: ) (bits_msb (a -:. 1)) |> Signal.concat_msb) a

let encoder a =
  let a = Signal.reverse a in
  let cases =
    List.init (width a) ~f:(fun i : Signal.t Comb.with_valid ->
      { valid = bit a i; value = of_int ~width:8 (width a - i) })
  in
  priority_select_with_default ~default:(Signal.zero 8) cases

let mantissa a =
  let open Signal in
  let x = Signal.reverse a in
  let shift_fwd_pad_back i =
    if i = width a - 1 then Signal.zero 23 else Signal.uresize (Signal.srl (Signal.sll a (i + 1)) 1) 23
  in
  let cases =
    List.init (width a) ~f:(fun i : Signal.t Comb.with_valid -> { valid = bit x i; value = shift_fwd_pad_back i })
  in
  priority_select_with_default ~default:(Signal.zero 23) cases

let priority_encoder =
  let priority = Signal.output "priority" (encoder (Signal.input "a" 24)) in
  Circuit.create_exn ~name:"priority_encoder" [ priority ]

let int_to_float =
  let to_float a =
    let sign = msb a in
    let decomped = de_2s_comp a in
    let priority = encoder decomped in
    let p () =
      let exponent = priority -:. 1 +:. 127 in
      let mantissa = mantissa decomped in
      Signal.concat_msb (List.concat [ [ sign ]; Signal.bits_msb exponent; Signal.bits_msb mantissa ])
    in
    mux2 (uresize (priority ==:. 0) 1) (Signal.zero 32) (p ())
  in
  let b = Signal.output "b" (to_float (Signal.input "a" 24)) in
  Hardcaml.Circuit.create_exn ~name:"int_to_float" [ b ]

let circuits = [ priority_encoder; int_to_float ]
