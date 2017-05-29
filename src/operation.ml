open Batteries

type t = {
  date : string;
  operation_type : string;
  operator : string;
  amount: float;
  currency: string;
}

(* Since t is a private type, the fields are not publicly available. So passing by getters is
needed *)
let get_amount t = t.amount

let get_value value =
  (* Floats are written the French way, e.g. 4,2 instead of 4.2 *)
  let (_, english_value) = String.replace value "," "." in
  try (Num.of_float_string english_value |> Num.to_float)
  with
    err -> raise (Failure ("Cannot convert the value '" ^ english_value ^ "'"))

let from_strings op_date op_type op_operator op_value op_currency =
    let value = get_value op_value in
      {
        date = op_date;
        operation_type = op_type;
        operator = op_operator;
        amount = value;
        currency = op_currency;
      }

let to_string {
    date;
    operation_type;
    operator;
    amount;
    currency;
    } = Printf.sprintf "%s %s %.2f%s" date operator amount currency
