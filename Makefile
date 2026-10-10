DIR ?= dir
MALICIOUS_DIR ?= malicious_dir
INTERVAL ?= 5

.PHONY: all pre_build run restore

all: run

pre_build:
	mkdir -p $(MALICIOUS_DIR)
	mkdir -p $(DIR)

run: pre_build
	./antivirusd.sh $(DIR) $(MALICIOUS_DIR) $(INTERVAL)

restore: pre_build
	./restore.sh $(DIR) $(MALICIOUS_DIR)