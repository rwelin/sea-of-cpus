
SIM_DIR=sim
TEST_DIR=test
TEST_LIBS=$(TEST_DIR)/lib
SRC_DIR=src

SOURCE_DIRS=$(TEST_LIBS) $(SRC_DIR)
SOURCES=$(foreach d,$(SOURCE_DIRS),$(addsuffix /*.vhd,$(d)))
TEST_SOURCES=$(wildcard $(TEST_DIR)/*.vhd)

filename=$(notdir $(basename $(1)))

testlog=$(SIM_DIR)/$(call filename,$(1))/isim.log

clean :
	rm -rf sim

# Execute all tests.
test : $(foreach t,$(TEST_SOURCES),$(call testlog,$(t)))

# Produce report for all failures in all tests.
$(SIM_DIR)/failures : test
	grep -i -L DONE $(SIM_DIR)/**/isim.log | xargs grep --colour=auto -i Failure -A 2 > $@
	cat $@

# Construct simulation environment from test.
$(SIM_DIR)/%/makefile :
	mkdir -p ${dir $@}
	cd ${dir $@}
	echo "SIM=$(word 2,$(subst /, ,$@))" > $@
	cat tools/mktest/sim-makefile >> $@

# Produce simulation reports for all tests.
$(SIM_DIR)/%/isim.log : $(SIM_DIR)/%/makefile $(TEST_DIR)/%.vhd $(SOURCES)
	cd $(dir $@) && $(MAKE) $(notdir $@)
