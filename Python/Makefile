PYTHON=python3
SRC_DIR=src

RED=\033[1;31m
GRN=\033[1;32m
YEL=\033[1;33m
RST=\033[0m

.PHONY: clean test

clean:
	@rm -f tmp Grace_kid.py Sully_*

test: $(BINARIES)
	@echo "$(YEL)Start tests$(RST)"
	@$(PYTHON) $(SRC_DIR)/Colleen.py > tmp
	@diff $(SRC_DIR)/Colleen.py tmp && echo "$(GRN)No differences found for Colleen!$(RST)" || echo "$(RED)Differences found for Colleen!$(RST)";
	@$(PYTHON) $(SRC_DIR)/Grace.py
	@diff $(SRC_DIR)/Grace.py Grace_kid.py && echo "$(GRN)No differences found for Grace!$(RST)" || echo "$(RED)Differences found for Grace!$(RST)";
	@$(PYTHON) $(SRC_DIR)/Sully.py
	@echo "$(RED)Check differences for Sully!$(RST)"
	@for i in $(shell seq 4 -1 -1); do \
		echo "$(YEL)Checking Sully_$$i.py...$(RST)"; \
		diff $(SRC_DIR)/Sully.py Sully_$$i.py || true; \
	done
	@echo "$(YEL)End tests$(RST)"
