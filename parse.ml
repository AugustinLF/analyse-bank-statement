open Batteries
(*ocamlfind ocamlc -package batteries -linkpkg parse.ml -o parse*)

type change = {
  date : string;
  change_type : string;
  operator : string;
  amount: float;
  currency: string;
}

let get_value value =
  let (_, english_value) = String.replace value "," "." in
  try (Num.of_float_string english_value |> Num.to_float)
  with
    err -> raise (Failure english_value)

let from_cells_to_change (line: string list) = match line with
  first :: second :: third :: fourth :: fifth :: [] ->
      let value = get_value fourth in
      Some {
        date = first;
        change_type = second;
        operator = third;
        amount = value;
        currency = fifth;
      }
  | _ -> None

let split_cells = String.nsplit ~by:";"
let from_line_to_change line = from_cells_to_change (split_cells line)

let change_to_string {
        date;
        change_type;
        operator;
        amount;
        currency;
      } = Printf.sprintf "%s %s %.2f%s" date operator (amount) currency

let print_cell change_option = match change_option with
  | None -> ()
  | Some change -> print_endline (change_to_string change)


let cells = File.lines_of "source.csv"
  |> List.of_enum
  |> List.drop 3
  |> List.map from_line_to_change

let () = List.iter print_cell cells
