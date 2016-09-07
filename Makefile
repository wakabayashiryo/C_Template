

# CC = arm-none-eabi-gcc
CC = gcc
RM = rm -f

TARGET := test
CFLAG := -I Inc -I Driver/Inc 

MAINSRC := Src
MAININC :=  Inc
OBJ := Debug
SUBSRC := Driver/Src
SUBINC := Driver/Inc
BIN := bin

MAINSRCS := $(wildcard $(MAINSRC)/*.c)
MAININCS := $(wildcard $(MAININC)/*.h)
OBJS := $(addprefix $(OBJ)/,$(MAINSRCS:%.c=%.o))

SUBSRCS := $(wildcard $(SUBSRC)/*.c)
SUBINCS := $(wildcard $(SUBINC)/*.h)
OBJS += $(addprefix $(OBJ)/,$(SUBSRCS:%.c=%.o))

DEPS := $(OBJS:%.o=%.d)

-include $(DEPS)

all: $(BIN)/$(TARGET)

$(BIN)/$(TARGET): $(OBJS)
	$(CC) -o $@ $^

$(OBJ)/$(MAINSRC)/%.o: $(MAINSRC)/%.c
	$(CC) $(CFLAG) -o $@ -c -MMD $<

$(OBJ)/$(SUBSRC)/%.o: $(SUBSRC)/%.c
	$(CC) $(CFLAG) -o $@ -c -MMD $< 

clean: 
	$(RM) $(BIN)/$(TARGET) $(shell (find ./ -name *.o)) $(shell (find ./ -name *.o))

print:
	-@echo 'MAINSRCS=$(MAINSRCS)'
	-@echo 'MAININCS=$(MAININCS)'
	-@echo 'OBJS=$(OBJS)'
	-@echo 'SUBSRCS=$(SUBSRCS)'
	-@echo 'SUBINCS=$(SUBINCS)'
	-@echo 'DEPS=$(DEPS)'

.PHONY: all clean print	