# =============================================================================
# Project
# =============================================================================

NAME1 := Colleen
NAME2 := Grace
NAME3 := Sully

BINARIES := $(NAME1) $(NAME2) $(NAME3)

SRC_DIR := src
SRC_DIR1 := Colleen
SRC_DIR2 := Grace
SRC_DIR3 := Sully
BUILD_DIR := .build
INC_DIR   := 

# =============================================================================
# Toolchain
# =============================================================================

CC          := gcc

CPPFLAGS    := $(if $(INC_DIR),-I$(INC_DIR))
CFLAGS      := -Wall -Wextra -Werror -MMD -MP
LDFLAGS     := 
LDLIBS      := 

# =============================================================================
# Sources & Objects
# =============================================================================

SRC1 := $(wildcard $(SRC_DIR)/$(SRC_DIR1)/*.c)
OBJ1 := $(patsubst $(SRC_DIR)/$(SRC_DIR1)/%.c,$(BUILD_DIR)/$(SRC_DIR1)/%.o,$(SRC1))

SRC2 := $(wildcard $(SRC_DIR)/$(SRC_DIR2)/*.c)
OBJ2 := $(patsubst $(SRC_DIR)/$(SRC_DIR2)/%.c,$(BUILD_DIR)/$(SRC_DIR2)/%.o,$(SRC2))

SRC3 := $(wildcard $(SRC_DIR)/$(SRC_DIR3)/*.c)
OBJ3 := $(patsubst $(SRC_DIR)/$(SRC_DIR3)/%.c,$(BUILD_DIR)/$(SRC_DIR3)/%.o,$(SRC3))

DEP := $(OBJ1:.o=.d) $(OBJ2:.o=.d) $(OBJ3:.o=.d)

# =============================================================================
# Build modes
# =============================================================================

DEBUG_FLAGS    := -g -O0
RELEASE_FLAGS  := -O3 -DNDEBUG

# =============================================================================
# Targets
# =============================================================================

.PHONY: all debug release clean fclean re test

all: $(BINARIES)

debug: CFLAGS += $(DEBUG_FLAGS)
debug: $(BINARIES)

release: CFLAGS += $(RELEASE_FLAGS)
release: fclean $(BINARIES)
.NOTPARALLEL: release

# =============================================================================
# Link
# =============================================================================

$(NAME1): $(OBJ1)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

$(NAME2): $(OBJ2)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

$(NAME3): $(OBJ3)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

# =============================================================================
# Compile
# =============================================================================

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	@mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# =============================================================================
# Cleaning
# =============================================================================

clean:
	@if [ -d $(BUILD_DIR) ]; then rm -rf $(BUILD_DIR) && printf "\033[1;31m\tDeleted: $(BUILD_DIR)\033[0m\n"; fi

fclean: clean
	@if [ -f $(NAME1) ]; then rm -rf $(NAME1) && printf "\033[1;31m\tDeleted: $(NAME1)\033[0m\n"; fi
	@if [ -f $(NAME2) ]; then rm -rf $(NAME2) && printf "\033[1;31m\tDeleted: $(NAME2)\033[0m\n"; fi
	@if [ -f $(NAME3) ]; then rm -rf $(NAME3) && printf "\033[1;31m\tDeleted: $(NAME3)\033[0m\n"; fi
	@rm -f $(NAME3)_*

re: fclean all

# =============================================================================
# Tests
# =============================================================================

test: $(BINARIES)
	@echo "\033[1;32m>>> Running Dr_Quine tests... (C)\033[0m"

	@./Colleen > tmp1
	@(diff $(SRC_DIR)/$(SRC_DIR1)/Colleen.c tmp1 && \
		echo "\033[1;32mNo differences found for Colleen !\033[0m") || \
		echo "\033[1;31mDifferences found for Colleen !\033[0m"
	@rm -f tmp1

	@./Grace
	@(diff $(SRC_DIR)/$(SRC_DIR2)/Grace.c Grace_kid.c >/dev/null && \
		printf "\033[1;32mNo differences found for Grace !\033[0m\n") || \
		printf "\033[1;31mDifferences found for Grace !\033[0m\n"
	@rm -f Grace_kid.c

	@./Sully
	@for i in 4 3 2 1 0; do \
		if diff $(SRC_DIR)/$(SRC_DIR3)/Sully.c Sully_$$i.c; then \
			printf "\033[1;32mNo differences found for Sully_%s !\033[0m\n" $$i; \
		else \
			printf "\033[1;31mDifferences found for Sully_%s !\033[0m\n" $$i; \
		fi; \
	done
	@rm -f $(NAME3)_*

# =============================================================================
# Dependencies
# =============================================================================

-include $(DEP)

# =============================================================================
# Resources
# =============================================================================

# https://www.reddit.com/r/C_Programming/comments/1ghy847/the_perfect_makefile/
# https://www.gnu.org/software/make/manual/html_node/Implicit-Variables.html
# 
#
