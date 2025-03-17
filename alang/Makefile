include $(MAKE_DIR)/Common.mk

ALANG_PATH := .
ALANG_BUILD_DIR := $(call platformpth,$(BUILD_DIR)/objs/alang)
ALANG_SRC_FILES := $(call rwildcard,$(ALANG_PATH)/,*.c)
ALANG_SRC_OBJS := $(call findobjs,$(ALANG_PATH),$(ALANG_BUILD_DIR),$(ALANG_SRC_FILES))

INCLUDES += -I $(COMPILER_DIR)/src

.PHONY: all

all: $(ALANG_APP)

$(ALANG_APP): $(ALANG_SRC_OBJS)
	$(call MKDIR,$(call platformpth,$(@D)))
	$(CXX) $(ALANG_SRC_OBJS) -o $(ALANG_APP) -L $(LIB_DIR) -l compiler

$(ALANG_BUILD_DIR)/%.o: $(ALANG_PATH)/%.c
	$(call MKDIR,$(@D))
	$(CXX) -MMD -MP -c $(INCLUDES) $< -o $@