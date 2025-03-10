include $(MAKE_DIR)/Common.mk

TEST_PATH := .
TEST_BUILD_DIR := $(call platformpth,$(BUILD_DIR)/objs/tests)
TEST_SRC_FILES := $(call rwildcard,$(TEST_PATH)/,*.c)
TEST_SRC_OBJS := $(call findobjs,$(TEST_PATH),$(TEST_BUILD_DIR),$(TEST_SRC_FILES))

.PHONY: all

all: $(TEST_APP)

$(TEST_APP): $(TEST_SRC_OBJS)
	$(call MKDIR,$(call platformpth,$(@D)))
	$(CXX) $(TEST_SRC_OBJS) -o $(TEST_APP) -L $(LIB_DIR) -l compiler -l utils

$(TEST_BUILD_DIR)/%.o: $(TEST_PATH)/%.c
	$(call MKDIR,$(@D))
	$(CXX) -MMD -MP -c -I $(call platformpth,$(VENDOR_DIR)/utest) $< -o $@