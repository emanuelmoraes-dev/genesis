BIN     = ./bin
LIB     = ./lib
OBJ     = ./obj
SRC     = ./src
MAIN    = ./src/tests
INCLUDE = ./include
SRC_LIB = ./src/lib

SUB_DIRS   = $(OBJ)/language/ports
LIB_FILES  = $(OBJ)/language/ports/language.o
MAIN_FILES = $(BIN)/basic

EXS   = c
EXH   = h
CC    = gcc
FLAGS = -O3 -Wall -std=c99
LIBS  = -L $(LIB) -lm -lge

all: dirs libge $(MAIN_FILES)

libge: dirs $(LIB_FILES)
	ar -rcs $(LIB)/libge.a $(LIB_FILES)

dirs:
	mkdir -p $(BIN) $(LIB) $(OBJ)
	mkdir -p $(SUB_DIRS)

clean:
	rm -rf $(BIN)
	rm -rf $(LIB)
	rm -rf $(OBJ)

$(OBJ)/%.o: $(SRC_LIB)/%.$(EXS) $(INCLUDE)/%.$(EXH)
	$(CC) $(FLAGS) -c $< -I $(INCLUDE) -o $@

$(BIN)/%: $(MAIN)/%.$(EXS)
	$(CC) $(FLAGS) $< -I $(INCLUDE) $(LIBS) -o $@