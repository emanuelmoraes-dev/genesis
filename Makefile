BIN     = ./bin
INCLUDE = ./include
LIB     = ./lib
OBJ     = ./obj
SRC     = ./src
MAIN    = ./src/tests
SRC_LIB = ./src/lib

LIB_FILES  = $(OBJ)/genesis.o
MAIN_FILES = $(BIN)/basic

EXS   = c
EXH   = h
CC    = gcc
FLAGS = -O3 -Wall
LIBS  = -L $(LIB) -lm -lge

all: dirs libge $(MAIN_FILES)

libge: dirs $(LIB_FILES)
	ar -rcs $(LIB)/libge.a $(OBJ)/*.o

clean:
	rm -rf $(BIN)
	rm -rf $(LIB)
	rm -rf $(OBJ)

dirs:
	mkdir -p $(BIN) $(LIB) $(OBJ)

$(OBJ)/%.o: $(SRC_LIB)/%.$(EXS) $(INCLUDE)/%.$(EXH)
	$(CC) $(FLAGS) -c $< -I $(INCLUDE) -o $@

$(BIN)/%: $(MAIN)/%.$(EXS)
	$(CC) $(FLAGS) $< -I $(INCLUDE) $(LIBS) -o $@