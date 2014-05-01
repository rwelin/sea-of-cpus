
ASM = ../../tools/assembler/assembler.py
OPCODES = ../../doc/isa/opcodes.txt

BIN = vhdl
SRC = asm

build: $(addprefix $(BIN)/,$(addsuffix .vhd,$(basename $(notdir $(wildcard $(SRC)/*.s)))))

clean:
	rm -rf $(BIN)

$(BIN)/%.vhd: $(SRC)/%.s $(ASM) $(OPCODES)
	@mkdir -p $(dir $@)
	$(ASM) $(OPCODES) $< > $@
