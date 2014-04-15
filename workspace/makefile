
SIM_DIR=sim
TEST_DIR=test
TEST_LIBS=$(TEST_DIR)/lib
SRC_DIR=src

SIM_MAKE_TEMPLATE=tools/template/sim-makefile

SOURCE_DIRS=$(TEST_LIBS) $(SRC_DIR)
SOURCES=$(foreach d,$(SOURCE_DIRS),$(d)/*.vhd)
TEST_SOURCES=$(wildcard $(TEST_DIR)/*.vhd)

filename=$(notdir $(basename $(1)))

testlog=$(SIM_DIR)/$(call filename,$(1))/isim.log

# Failures in a simulation logs.
failures=grep -i -L DONE $(1) | xargs -r grep --colour=auto -i Failure -A 2

.PHONY : clean test $(SIM_DIR)/failures

# All test logs.
test : $(foreach t,$(TEST_SOURCES),$(call testlog,$(t)))

clean :
	rm -rf sim

# Produce report for all failures in all tests.
$(SIM_DIR)/failures : test
	$(call failures,$(SIM_DIR)/**/isim.log)

# Produce report for all failures in a single testbench.
$(SIM_DIR)/%/failures : $(SIM_DIR)/%/isim.log
	$(call failures,$<)

# Construct simulation environment from test.
$(SIM_DIR)/%/makefile :
	mkdir -p $(dir $@)
	cd $(dir $@)
	echo "SIM=$(word 2,$(subst /, ,$@))" > $@
	cat $(SIM_MAKE_TEMPLATE) >> $@

# Produce simulation reports for all tests.
$(SIM_DIR)/%/isim.log : $(SIM_DIR)/%/makefile $(TEST_DIR)/%.vhd $(SOURCES)
	cd $(dir $@) && $(MAKE) $(notdir $@)
