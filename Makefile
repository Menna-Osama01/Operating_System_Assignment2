# Makefile for Assignment2

.PHONY: all clean

CC        = gcc
SRC_DIR   = src
BIN_DIR   = bin

# The source files
SRCS      = $(SRC_DIR)/process_creation.c \
            $(SRC_DIR)/file1.c \
            $(SRC_DIR)/file2.c \
            $(SRC_DIR)/simple_program.c

# The executables
EXEC      = process_creation file_program simple_program
BINS      = $(addprefix $(BIN_DIR)/, $(EXEC))

# The default target
all: $(BINS)

# The rule to create bin directory if needed
$(BIN_DIR):
	mkdir $(BIN_DIR)

# To compile each executable
$(BIN_DIR)/process_creation: $(SRC_DIR)/process_creation.c | $(BIN_DIR)
	$(CC) $< -o $@

$(BIN_DIR)/file_program: $(SRC_DIR)/file1.c $(SRC_DIR)/file2.c | $(BIN_DIR)
	$(CC) $^ -o $@

$(BIN_DIR)/simple_program: $(SRC_DIR)/simple_program.c | $(BIN_DIR)
	$(CC) $< -o $@

# The clean rule
clean:
	rm -f $(BIN_DIR)/*
