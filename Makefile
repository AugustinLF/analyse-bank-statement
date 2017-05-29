# https://github.com/ocaml/ocamlbuild/blob/master/examples/03-packages/Makefile
OCB_FLAGS = -use-ocamlfind -I src -I lib
OCB = 		ocamlbuild $(OCB_FLAGS)

all: 		byte

byte:
			$(OCB) parse.byte

.PHONY: 	all byte
