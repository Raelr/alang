include make/Common.mk

export MAKE_DIR := $(abspath make)
export LIB_DIR := $(abspath lib)
export BUILD_DIR := $(abspath build)
export SCRIPTS_DIR := $(abspath scripts)
export VENDOR_DIR := $(abspath vendor)

export ALANG_DIR := $(abspath alang)
export ALANG_APP := $(BUILD_DIR)/alang/alang

export COMPILER_LIB := $(LIB_DIR)/libcompiler.a
export COMPILER_DIR := $(abspath compiler)

export TEST_APP := $(BUILD_DIR)/tests/tests
export TEST_DIR := $(abspath tests)

export UTILS_LIB := $(LIB_DIR)/libutils.a
export UTILS_DIR := $(abspath utils)

export INCLUDES := -I $(UTILS_DIR)


.PHONY: all alang compiler tests utils

all: alang compiler tests utils

$(COMPILER_LIB): $(UTILS_LIB)
	"$(MAKE)" -C $(COMPILER_DIR)

$(UTILS_LIB):
	"$(MAKE)" -C $(UTILS_DIR)

$(ALANG_APP): $(COMPILER_LIB)
	"$(MAKE)" -C $(ALANG_DIR)

$(TEST_APP): $(COMPILER_LIB)
	"$(MAKE)" -C $(TEST_DIR)

alang: $(ALANG_APP)

utils: $(UTILS_LIB)

compiler: $(COMPILER_LIB)

tests: $(TEST_APP)

clean:
	$(info "Cleaning project")
	$(info "Deleting $(BUILD_DIR) and all contents...")
	$(call RM,$(BUILD_DIR))
	$(info "Deleting $(LIB_DIR) and all contents...")
	$(call RM,$(LIB_DIR))
	$(info "Cleaning done")