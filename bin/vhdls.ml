open Lib

let () = List.iter (Hardcaml.Rtl.output Vhdl) (List.concat [ Adder.circuits; Int_to_ieee_float.circuits ])
