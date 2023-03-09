open Hardcaml
open Hardcaml.Signal
open Base

let priority_encoder =
  let encoder a =
    let cases =
      List.init (width a) ~f:(fun i : Signal.t Comb.with_valid -> { valid = bit a i; value = of_int ~width:8 i })
    in
    priority_select_with_default ~default:(Signal.zero 8) cases
  in
  let priority = Signal.output "priority" (encoder (Signal.input "a" 24)) in
  Circuit.create_exn ~name:"priorityEncoder" [ priority ]

let int_to_float =
  let to_float a =
    let sign = msb a in
    let decomped = mux2 sign (Signal.concat_msb (List.map ~f:( ~: ) (bits_msb a)) +: of_int ~width:(width a) 1) a in
    let encoder =
      Instantiation.create () ~name:"priorityEncoder" ~inputs:[ "a", decomped ] ~outputs:[ "priority", 8 ]
    in
    let exponent = Map.find_exn encoder "priority" in
    let mantisa = List.mapi ~f:(fun i s -> exponent >:. i &: s) (Signal.bits_msb decomped) in
    Signal.concat_msb (List.concat [ [ sign ]; Signal.bits_msb exponent; mantisa ])
  in

  let b = Signal.output "b" (to_float (Signal.input "a" 24)) in
  Hardcaml.Circuit.create_exn ~name:"int_to_float" [ b ]

let circuits = [ priority_encoder; int_to_float ]
