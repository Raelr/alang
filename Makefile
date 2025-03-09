include make/Common.mk

export MAKE_DIR := $(call platformpth,$(abspath make))
export LIB_DIR := $(call platformpth,$(abspath lib))
export BUILD_DIR := $(call platformpth,$(abspath build))
export SCRIPTS_DIR := $(call platformpth,$(abspath scripts))
export VENDOR_DIR := $(call platformpth,$(abspath vendor))

export ALANG_DIR := $(call platformpth,$(abspath alang))
export ALANG_APP := $(call platformpth,$(BUILD_DIR)/alang/alang)

export COMPILER_LIB := $(call platformpth,$(LIB_DIR)/libcompiler.a)
export COMPILER_DIR := $(call platformpth,$(abspath compiler))

export TEST_APP := $(call platformpth,$(BUILD_DIR)/tests/tests)
export TEST_DIR := $(call platformpth,$(abspath tests))

export BENCHMARK_APP := $(call platformpth,$(BUILD_DIR)/benchmark/benchmark)
export BENCHMARK_DIR := $(call platformpth,$(abspath benchmark))

.PHONY: all alang compiler tests

all: alang compiler tests

$(COMPILER_LIB):
	"$(MAKE)" -C $(COMPILER_DIR)

$(ALANG_APP): $(COMPILER_LIB)
	"$(MAKE)" -C $(ALANG_DIR)

$(TEST_APP): $(COMPILER_LIB)
	"$(MAKE)" -C $(TEST_DIR)

alang: $(ALANG_APP)

compiler: $(COMPILER_LIB)

tests: $(TEST_APP)

clean:
	$(info "Cleaning project")
	$(info "Deleting $(BUILD_DIR) and all contents...")
	$(call RM,$(BUILD_DIR))
	$(info "Deleting $(LIB_DIR) and all contents...")
	$(call RM,$(LIB_DIR))
	$(info "Cleaning done")