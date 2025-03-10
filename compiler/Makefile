include $(MAKE_DIR)/Common.mk

COMPILER_PATH := $(call platformpth,$(abspath .))
COMPILER_BUILD_DIR := $(call platformpth,$(BUILD_DIR)/objs/compiler)
COMPILER_SRC_FILES := $(call rwildcard,$(COMPILER_PATH)/,*.c)
COMPILER_SRC_OBJS := $(call findobjs,$(COMPILER_PATH),$(COMPILER_BUILD_DIR),$(COMPILER_SRC_FILES))

.PHONY: all

all: $(COMPILER_LIB)

$(COMPILER_LIB): $(COMPILER_SRC_OBJS)
	$(call RM,$(call platformpth,$(COMPILER_LIB)))
	$(call COMBINELIBS,'',$(COMPILER_SRC_OBJS),$(LIB_DIR),compiler)

$(COMPILER_BUILD_DIR)/%.o: $(COMPILER_PATH)/%.c
	$(call MKDIR,$(call platformpth,$(@D)))
	$(CXX) -MMD -MP -c $< -o $(call platformpth,$@)