default:
	dune build

test:
	dune runtest

watch:
	dune build --watch

fmt:
	dune build --auto-promote @fmt

vhdl:
	dune exec ./bin/main.exe
