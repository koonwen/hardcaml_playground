open !Base
open Hardcaml
open Signal

let int24_to_int24sm i24 =
  let sel = msb i24 in
  (* Least significant bits "not-ted" *)
  let magnitude = ~:(lsbs i24) in
  let negative_i24sm = insert ~into:i24 magnitude ~at_offset:1 in
  (* If positive return input, else get take the converted negative_i24sm *)
  mux sel [i24; negative_i24sm]

(* Takes in sign magnitude int24 and returns the exponent position *)
let priority_encoder i24sm =
  let magnitude = lsbs i24sm in
  let w = width magnitude in
  let cases = List.init w
      ~f:(fun i -> {valid = bit magnitude i; value = of_int ~width:8 i}
                   : int ->  (t,t) Comb.with_valid2) |> List.rev in
  priority_select_with_default ~default:(zero 8) cases

let mantissa sel magnitude =
  let lst = List.init 4 ~f:(fun i -> sll magnitude i) in
  mux sel lst

let itof =
  let int24 = input "I" 24 in
  let int24sm = int24 |> int24_to_int24sm in
  let position = priority_encoder int24sm in
  let sign, magnitude = split_in_half_msb int24sm in
  let exponent = (of_int ~width:8 127) +: position in
  let fraction = mantissa position magnitude in
  let ieee_float = output "O" (concat_msb [sign; exponent; fraction]) in
  Circuit.create_exn ~name:"itof" [ ieee_float ]

let () = Rtl.print Vhdl itof
