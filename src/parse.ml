open Batteries

let from_cells_to_operation (line: string list) = match line with
  | first :: second :: third :: fourth :: fifth :: [] ->
      Some (Operation.from_strings first second third fourth fifth)
  | _ -> None

let split_cells = String.nsplit ~by:";"
let from_line_to_operation line = from_cells_to_operation (split_cells line)

let print_cell operation_option = match operation_option with
  | None -> ()
  | Some operation -> print_endline (Operation.to_string operation)

let extract_lines source = File.lines_of source
  |> List.of_enum
  |> List.drop 3  (* The first three lines are not relevant *)

let () = extract_lines "source.csv"
  |> List.map from_line_to_operation
  |> List.iter print_cell
