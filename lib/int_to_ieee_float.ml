open Hardcaml
open Hardcaml.Signal

let printf = Printf.printf

open Base

let de_2s_comp a = mux2 (msb a) (List.map ~f:Signal.( ~: ) (bits_msb (a -:. 1)) |> Signal.concat_msb) a

let encoder a =
  let a = Signal.reverse a in
  let cases =
    List.init (width a) ~f:(fun i : Signal.t Comb.with_valid ->
      { valid = bit a i; value = of_int ~width:8 (width a - i - 1) })
  in
  priority_select_with_default ~default:(Signal.zero 8) cases

let mantissa a =
  let open Signal in
  let x = Signal.reverse a in
  let shift_fwd_pad_back a i =
    let shift_from = a.:[width a - 1, i + 1] in
    List.concat [ shift_from |> bits_msb; List.init (width a - 1 - width shift_from) ~f:(fun _ -> Signal.zero 1) ]
    |> concat_msb
  in
  let cases =
    List.init (width a - 1) ~f:(fun i : Signal.t Comb.with_valid -> { valid = bit x i; value = shift_fwd_pad_back a i })
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
    let exponent = priority +:. 127 &: sresize sign (Signal.width priority) in
    let mantissa = mantissa decomped in
    Signal.concat_msb (List.concat [ [ sign ]; Signal.bits_msb exponent; Signal.bits_msb mantissa ])
  in
  let b = Signal.output "b" (to_float (Signal.input "a" 24)) in
  Hardcaml.Circuit.create_exn ~name:"int_to_float" [ b ]

let circuits = [ priority_encoder; int_to_float ]
