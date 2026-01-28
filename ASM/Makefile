BINARIES=Colleen Grace Sully

ASMC=nasm
ASMFLAGS=-f elf64

LD=gcc

SRC_DIR=src
BUILD_DIR=.build

SRC=$(SRC_DIR)/Colleen.s $(SRC_DIR)/Grace.s $(SRC_DIR)/Sully.s
OBJ=$(SRC:$(SRC_DIR)/%.s=$(BUILD_DIR)/%.o)
DEP=$(OBJ:%.o=%.d)

RED=\033[1;31m
GRN=\033[1;32m
YEL=\033[1;33m
RST=\033[0m

all: $(BINARIES)

$(BUILD_DIR):
	@mkdir -p $(BUILD_DIR)

Colleen: $(BUILD_DIR)/Colleen.o
	$(LD) $^ -o $@

Grace: $(BUILD_DIR)/Grace.o
	$(LD) $^ -o $@

Sully: $(BUILD_DIR)/Sully.o
	$(LD) $^ -o $@

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.s | $(BUILD_DIR)
	$(ASMC) $(ASMFLAGS) $< -o $@

clean:
	@rm -rf $(BUILD_DIR)
	@rm -f tmp Grace_kid.s Sully_-1.s Sully_0 Sully_0.s Sully_1 Sully_1.s Sully_2 Sully_2.s Sully_3 Sully_3.s Sully_4 Sully_4.s

fclean: clean
	@rm -f $(BINARIES)

re: fclean all

test: $(BINARIES)
	@echo "$(YEL)Start tests$(RST)"
	@./Colleen > tmp
	@diff $(SRC_DIR)/Colleen.s tmp && echo "$(GRN)No differences found for Colleen!$(RST)" || echo "$(RED)Differences found for Colleen!$(RST)";
	@./Grace
	@diff $(SRC_DIR)/Grace.s Grace_kid.s && echo "$(GRN)No differences found for Grace!$(RST)" || echo "$(RED)Differences found for Grace!$(RST)";
	@./Sully
	@echo "$(RED)Check differences for Sully!$(RST)"
	@for i in $(shell seq 4 -1 -1); do \
		echo "$(YEL)Checking Sully_$$i.s...$(RST)"; \
		diff $(SRC_DIR)/Sully.s Sully_$$i.s || true; \
	done
	@echo "$(YEL)End tests$(RST)"

-include $(DEP)

.PHONY: all clean fclean re test
