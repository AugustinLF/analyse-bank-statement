# https://github.com/ocaml/ocamlbuild/blob/master/examples/03-packages/Makefile
OCB_FLAGS = -use-ocamlfind -I src -I tests
OCB = 		ocamlbuild $(OCB_FLAGS)

all: 		byte

byte:
			$(OCB) parse.byte

test:
			$(OCB) operationTest.byte && ./operationTest.byte

.PHONY: 	all byte test
