findobjs = $(patsubst $1/%,$2/%,$(patsubst %.c,%.o,$3))
rwildcard = $(filter-out ../%,$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2)))
platformpth = $(subst /,$(PATHSEP),$1)

ifeq ($(OS), Windows_NT)
	PATHSEP :=\$(BLANK)
	MKDIR = cmd.exe /C if not exist $(call platformpth,$1) mkdir $(call platformpth,$1) || ver>nul
    RM = cmd.exe /C if exist $(call platformpth,$1) rd /S /Q $(call platformpth,$1) || ver>nul
    COMBINELIBS = cmd.exe /C powershell.exe -executionpolicy bypass $(SCRIPTS_DIR)\combinelibs.ps1 --src_objs $2 --output_dir $3 --output_name $4 --src_libs $1
    CXX := gcc.exe
else
	PATHSEP :=/
	MKDIR = $(shell mkdir -p $1)
	RM = $(shell rm -rf $1)
	COMBINELIBS = $(SCRIPTS_DIR)/combinelibs.sh --src_libs $1 --src_objs $2 --output_dir $3 --output_name $4
	CXX := clang
endif