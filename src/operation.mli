type t

(** Create an operation *)
val from_strings : string -> string -> string -> string -> string -> t

(** Return a string version f an operation *)
val to_string : t -> string

val get_amount : t -> float
