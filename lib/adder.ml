open Hardcaml.Signal

let one_bit_adder =
  let adder a b = a +: b in
  let c = output "c" (adder (input "a" 1) (input "b" 1)) in
  Hardcaml.Circuit.create_exn ~name:"adder_1_bit" [ c ]

let four_bit_adder =
  let adder a b = a +: b in
  let c = output "c" (adder (input "a" 1) (input "b" 1)) in
  Hardcaml.Circuit.create_exn ~name:"adder_4_bit" [ c ]

let circuits = [ one_bit_adder; four_bit_adder ]
