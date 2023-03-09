open Hardcaml
open Hardcaml.Signal

let printf = Printf.printf

open Base

let encoder a =
  let cases =
    List.init (width a) ~f:(fun i : Signal.t Comb.with_valid -> { valid = bit a i; value = of_int ~width:8 i })
  in
  priority_select_with_default ~default:(Signal.zero 8) cases

let de_2s_comp a = mux2 (msb a) (List.map ~f:Signal.negate (bits_msb (a -:. 1)) |> Signal.concat_msb) a

let priority_encoder =
  let priority = Signal.output "priority" (encoder (Signal.input "a" 24)) in
  Circuit.create_exn ~name:"priority_encoder" [ priority ]

let int_to_float_base get_exponent =
  let to_float a =
    let sign = msb a in
    let decomped = de_2s_comp a in
    let exponent = get_exponent decomped in
    (* let mantisa_untrunc = List.mapi ~f:(fun i s -> uresize (exponent >:. i) 1 &: s) (Signal.bits_msb decomped) in *)
    let mantisa =
      match List.drop_last @@ Signal.bits_msb decomped with
      | None -> []
      | Some mantisa -> mantisa
    in
    Signal.concat_msb (List.concat [ [ sign ]; Signal.bits_msb exponent; mantisa ])
  in
  let b = Signal.output "b" (to_float (Signal.input "a" 24)) in
  Hardcaml.Circuit.create_exn ~name:"int_to_float" [ b ]

let int_to_float =
  let get_exponent decomped =
    let encoder =
      Instantiation.create () ~name:"priority_encoder" ~inputs:[ "a", decomped ] ~outputs:[ "priority", 8 ]
    in
    Map.find_exn encoder "priority"
  in
  int_to_float_base get_exponent

let int_to_float_inline = int_to_float_base encoder

let circuits = [ priority_encoder; int_to_float ]
