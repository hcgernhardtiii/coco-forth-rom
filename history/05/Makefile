SHELL := /bin/bash

CURRENT_VER := $(basename $(shell ls *.6809 | grep -P '^\d+\.6809' | sort -r | head -n 1))
NEXT_VER := $(shell expr $(CURRENT_VER) + 1 )
NEXT_VER := $(shell printf "%02d" $(NEXT_VER) )

$(CURRENT_VER).rom: $(CURRENT_VER).6809 dict.6809 errhndlrs.6809
	asm6809 $(CURRENT_VER).6809 -l $(CURRENT_VER).lst -o $(CURRENT_VER).rom
	cp $(CURRENT_VER).rom $(HOME)/mame/roms/coco/bas10.rom

assemble: $(CURRENT_VER).rom

run: assemble
	mame coco -debug -skip_gameinfo -window -nomaximize -resolution0 640x480 -bios b10 -ext ""

nodebug: assemble
	mame coco -skip_gameinfo -nomouse -window -nomaximize -resolution0 640x480 -bios b10 -ext ""

incver:
	cp $(CURRENT_VER).6809 $(NEXT_VER).6809
	cp dict.6809 dict_$(CURRENT_VER).6809
	cp errhndlrs.6809 errhndlrs_$(CURRENT_VER).6809


clean:
	-rm *.rom
	-rm *.lst



