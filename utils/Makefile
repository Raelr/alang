include $(MAKE_DIR)/Common.mk

UTILS_PATH := $(abspath .)
UTILS_BUILD_DIR := $(BUILD_DIR)/objs/utils
UTILS_SRC_FILES := $(call rwildcard,$(UTILS_PATH)/,*.c)
UTILS_SRC_OBJS := $(call findobjs,$(UTILS_PATH),$(UTILS_BUILD_DIR),$(UTILS_SRC_FILES))
UTILS_DEPENDS := $(patsubst %.o,%.d,$(call rwildcard,$(UTILS_BUILD_DIR)/,*.o))

.PHONY: all

all: $(UTILS_LIB)

$(UTILS_LIB): $(UTILS_SRC_OBJS)
	$(call RM,$(UTILS_LIB))
	$(call MKDIR,$(LIB_DIR))
	$(call COMBINELIBS,'',$(UTILS_SRC_OBJS),$(LIB_DIR),utils)

-include $(UTILS_DEPENDS)

$(UTILS_BUILD_DIR)/%.o: $(UTILS_PATH)/%.c
	$(call MKDIR,$(BUILD_DIR))
	$(call MKDIR,$(call platformpth,$(@D)))

	$(CXX) -std=c17 -MMD -MP -c $(call platformpth,$<) -o $(call platformpth,$@)