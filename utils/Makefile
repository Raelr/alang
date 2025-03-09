include $(MAKE_DIR)/Common.mk

UTILS_PATH := $(call platformpth,$(abspath .))
UTILS_BUILD_DIR := $(call platformpth,$(BUILD_DIR)/objs/utils)
UTILS_SRC_FILES := $(call rwildcard,$(UTILS_PATH)/,*.c)
UTILS_SRC_OBJS := $(call findobjs,$(UTILS_PATH),$(UTILS_BUILD_DIR),$(UTILS_SRC_FILES))

.PHONY: all

all: $(UTILS_LIB)

$(UTILS_LIB): $(UTILS_SRC_OBJS)
	$(call RM,$(UTILS_LIB))
	$(call MKDIR,$(LIB_DIR))
	$(call COMBINELIBS,'',$(UTILS_SRC_OBJS),$(LIB_DIR),utils)

$(UTILS_BUILD_DIR)/%.o: $(UTILS_PATH)/%.c
	$(call MKDIR,$(@D))
	gcc.exe -std=c17 -MMD -MP -c $< -o $(call platformpth,$@)