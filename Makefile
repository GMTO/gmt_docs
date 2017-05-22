SHELL := /bin/bash
# ANSI COLOR codes
C_BLUE=\\033[36m
C_GREEN=\\033[32m
C_GREY=\\033[37m
C_NORMAL=\\033[0m
C_RED=\\033[31m

# 256 (8-bit) COLOR codes
C_ORANGE=\\033[38;5;208m
C_BLUE_NICE=\\033[38;5;105m

C_OK=${C_GREEN}✔ Done${C_NORMAL}
C_ERROR=${C_RED}✗ Failed${C_NORMAL}

MODEL_DIR			 = ../gmt_model
BIN_DIR				 = $(MODEL_DIR)/bin
COFFEE_FILES   = $(shell find $(MODEL_DIR)/src -name "*.coffee")
DOC_FILES      = $(shell find $(MODEL_DIR)/src -name "*.md" -o -name "*.hbs" -o -name "*.rst")

all: clean latexpdf html
	@printf "${C_BLUE_NICE}Success!${C_NORMAL}\n	"

html:
	@printf "${C_BLUE}Generating HTML files${C_NORMAL}\n"
	make -C src html
	@printf "${C_BLUE}Success!${C_NORMAL}\n"

.PHONY: latex
latex:
	make -C src latex

.PHONY: latexpdf
latexpdf:
	@printf "${C_BLUE}Updating documentation resources${C_NORMAL}\n"
	if [[ ! -d ./docs/source/resources ]]; then mkdir -p ./docs/source/resources; fi
	cd $(MODEL_DIR)/src; find . -type f -path "*resources*" -exec cp {} ../../gmt_docs/docs/source/resources/ \;
	@printf "${C_BLUE}Generating RST files${C_NORMAL}\n"
	gds exec swc_sys.gen_documents
	@printf "${C_BLUE}Generating LATEX and PDF files${C_NORMAL}\n"
	make -C src latexpdf
	@printf "${C_BLUE}Success!${C_NORMAL}\n"

.PHONY: jenkins
jenkins:
	@printf "${C_BLUE}Updating documentation resources${C_NORMAL}\n"
	if [[ ! -d ./docs/source/resources ]]; then mkdir -p ./docs/source/resources; fi
	cd $(MODEL_DIR)/src; find . -type f -path "*resources*" -exec cp {} ../../gmt_docs/docs/source/resources/ \;
	@printf "${C_BLUE}Generating RST files${C_NORMAL}\n"
	gds exec swc_sys.gen_documents
	@printf "${C_BLUE}Generating HTML and PDF files${C_NORMAL}\n"
	make -C src jenkins
	@printf "${C_BLUE}Success!${C_NORMAL}\n"

clean:
	rm -fr build html
	make -C src clean

build: clean all
	@printf "${C_BLUE_NICE}Success!${C_NORMAL}\n"
