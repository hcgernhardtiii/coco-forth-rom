SHELL := /bin/bash

CURRENT_VER := $(shell ls history | tail -n 1)
NEXT_VER := $(shell expr $(CURRENT_VER) + 1 )
NEXT_VER := $(shell printf "%02d" $(NEXT_VER) )

main.rom: main.6809 dict.6809 errhndlrs.6809
	asm6809 main.6809 -l main.lst -o main.rom
	cp main.rom $(HOME)/mame/roms/coco/bas10.rom

assemble: main.rom

run: assemble
	mame coco -debug -skip_gameinfo -window -nomaximize -resolution0 800x600 -bios b10 -ext ""

nodebug: assemble
	mame coco -skip_gameinfo -nomouse -window -nomaximize -resolution0 800x600 -bios b10 -ext ""

incver:
	mkdir history/$(NEXT_VER)
	cp main.6809 history/$(NEXT_VER)/main.6809
	cp dict.6809 history/$(NEXT_VER)/dict.6809
	cp errhndlrs.6809 history/$(NEXT_VER)/errhndlrs.6809
	cp Makefile history/$(NEXT_VER)/Makefile

clean:
	-rm *.rom
	-rm *.lst



