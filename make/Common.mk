findobjs = $(patsubst $1/%,$2/%,$(patsubst %.c,%.o,$3))
rwildcard = $(filter-out ../%,$(wildcard $1$2) $(foreach d,$(wildcard $1*),$(call rwildcard,$d/,$2)))
platformpth = $(subst /,$(PATHSEP),$1)

ifeq ($(OS), Windows_NT)
	PATHSEP :=\$(BLANK)
	MKDIR = $(shell cmd.exe /C if not exist $(call platformpth, $1) mkdir $(call platformpth,$1) || ver>nul)
    RM = $(shell cmd.exe /C rd /S /Q $1)
else
	PATHSEP :=/
	MKDIR = $(shell mkdir -p $1)
	RM = $(shell rm -rf $1)
endif