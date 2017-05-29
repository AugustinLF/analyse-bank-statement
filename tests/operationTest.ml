open OUnit2

let test_amount_from_strings test_ctxt =
    assert_equal
    12.99
    (
        Operation.from_strings "11/05/2017" "VIR RECU" "VIGP" "12,99" "EUR"
        |> Operation.get_amount
    )

let test_operation =
    "Operation" >:::
    ["amount from string" >:: test_amount_from_strings]

let () = run_test_tt_main test_operation
