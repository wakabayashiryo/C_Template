

# CC = arm-none-eabi-gcc
CC = gcc
RM = rm -f

TARGET := test
CFLAG := -I Inc -I Driver/Inc 

MAINSRC := Src
MAININC := Inc
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

.PHONY: all

-include $(DEPS)

all: $(BIN)/$(TARGET)

$(BIN)/$(TARGET): $(OBJS)
	$(CC) -o $@ $^

$(OBJ)/$(MAINSRC)/%.o: $(MAINSRC)/%.c
	$(CC) $(CFLAG) -o $@ -c -MMD $<

$(OBJ)/$(SUBSRC)/%.o: $(SUBSRC)/%.c
	$(CC) $(CFLAG) -o $@ -c -MMD $< 

.PHONY: clean
clean: 
	$(RM) $(BIN)/$(TARGET) $(shell (find ./ -name *.o)) $(shell (find ./ -name *.o))

.PHONY: print
print:
	-@echo $(MAINSRCS)
	-@echo $(MAININCS)
	-@echo $(OBJS)
	-@echo $(SUBSRCS)
	-@echo $(SUBINCS)
	-@echo $(DEPS)
	
	