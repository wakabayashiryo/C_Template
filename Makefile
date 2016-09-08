

# CC = arm-none-eabi-gcc
CC = gcc
RM = rm -f

TARGET := test
CFLAG := -c -g -MMD -MP -Wall -Wextra -Winit-self
INCLUDE := -I Inc -I Driver/Inc 

MAINSRC := Src
MAININC :=  Inc
OBJ := Debug
SUBSRC := Driver/Src
SUBINC := Driver/Inc
BIN := bin

MAINSRCS := $(wildcard $(MAINSRC)/*.c)
MAININCS := $(wildcard $(MAININC)/*.h)
OBJS := $(addprefix $(OBJ)/,$(notdir $(MAINSRCS:%.c=%.o)))

SUBSRCS := $(wildcard $(SUBSRC)/*.c)
SUBINCS := $(wildcard $(SUBINC)/*.h)
OBJS += $(addprefix $(OBJ)/,$(notdir $(SUBSRCS:%.c=%.o)))

DEPS := $(OBJS:%.o=%.d)

.PHONY: all clean print	

all: $(BIN)/$(TARGおT)

$(BIN)/$(TARGET): $(OBJS)
	$(CC) -o $@ $^

$(OBJ)/%.o: $(MAINSRC)/%.c
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(SUBSRC)/%.c
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $< 

-include $(DEPS)#-includeは.PHONYとallの間に入れないように

clean: 
	$(RM) $(BIN)/$(TARGET) $(shell (find ./ -name *.o)) $(shell (find ./ -name *.d))

print:
	-@echo 'MAINSRCS=$(MAINSRCS)'
	-@echo 'MAININCS=$(MAININCS)'
	-@echo 'OBJS=$(OBJS)'
	-@echo 'SUBSRCS=$(SUBSRCS)'
	-@echo 'SUBINCS=$(SUBINCS)'
	-@echo 'DEPS=$(DEPS)'
