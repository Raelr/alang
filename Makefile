include make/Common.mk

export MAKE_DIR := $(abspath make)
export BUILD_DIR := $(call platformpth,$(abspath build))
export ALANG_DIR := $(abspath alang)
export ALANG_APP := $(call platformpth,$(BUILD_DIR)/alang/alang)

.PHONY: all alang

all: alang

$(ALANG_APP):
	"$(MAKE)" -C $(ALANG_DIR)

alang: $(ALANG_APP)

clean:
	$(info "Cleaning project")
	$(info "Deleting $(BUILD_DIR) and all contents...")
	$(call RM,$(BUILD_DIR))
	$(info "Cleaning done")