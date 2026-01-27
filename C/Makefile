BINARIES=Colleen Grace Sully

CC=gcc
CFLAGS=-Wall -Wextra -Werror -MMD

SRC_DIR=src
BUILD_DIR=.build

SRC=$(SRC_DIR)/Colleen.c $(SRC_DIR)/Grace.c $(SRC_DIR)/Sully.c
OBJ=$(SRC:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
DEP=$(OBJ:%.o=%.d)

RED=\033[1;31m
GRN=\033[1;32m
YEL=\033[1;33m
RST=\033[0m

all: $(BINARIES)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

Colleen: $(BUILD_DIR)/Colleen.o
	$(CC) $(CFLAGS) $^ -o $@

Grace: $(BUILD_DIR)/Grace.o
	$(CC) $(CFLAGS) $^ -o $@

Sully: $(BUILD_DIR)/Sully.o
	$(CC) $(CFLAGS) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f tmp Grace_kid.c Sully_-1.c Sully_0 Sully_0.c Sully_1 Sully_1.c Sully_2 Sully_2.c Sully_3 Sully_3.c Sully_4 Sully_4.c

fclean: clean
	@rm -f $(BINARIES)

re: fclean all

test: $(BINARIES)
	@echo "$(YEL)Start tests$(RST)"
	@./Colleen > tmp
	@diff $(SRC_DIR)/Colleen.c tmp && echo "$(GRN)No differences found for Colleen!$(RST)" || echo "$(RED)Differences found for Colleen!$(RST)";
	@./Grace
	@diff $(SRC_DIR)/Grace.c Grace_kid.c && echo "$(GRN)No differences found for Grace!$(RST)" || echo "$(RED)Differences found for Grace!$(RST)";
	@./Sully
	@echo "$(RED)Check differences for Sully!$(RST)"
	@for i in $(shell seq 4 -1 -1); do \
		echo "$(YEL)Checking Sully_$$i.c...$(RST)"; \
		diff $(SRC_DIR)/Sully.c Sully_$$i.c || true; \
	done
	@echo "$(YEL)End tests$(RST)"
	@make fclean

-include $(DEP)

.PHONY: all clean fclean re test
