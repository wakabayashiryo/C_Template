

# CC = arm-none-eabi-gcc
CC = gcc
RM = rm -f

TARGET := test
CFLAG := -I Inc -I Driver/Inc/ 

MAINSRC := Src
MAININC := Inc
OBJ := Debug
SUBSRC := Driver/Src
SUBINC := Driver/Inc

MAINSRCS := $(wildcard $(MAINSRC)/*.c)
MAININCS := $(wildcard $(MAININC)/*.h)
OBJS := $(addprefix $(OBJ)/,$(MAINSRCS:%.c=%.o))

SUBSRCS := $(wildcard $(SUBSRC)/*.c)
SUBINCS := $(wildcard $(SUBINC)/*.h)
OBJS += $(addprefix $(OBJ)/,$(SUBSRCS:%.c=%.o))

DEPS := $(OBJS:%.o=%.d)

-include $(DEPS)

.PHONY: all

$(TARGET): $(OBJS)
	$(CC) -o $@ $^

$(OBJ)/$(MAINSRC)/%.o: $(MAINSRC)/%.c
	$(CC) $(CFLAG) -o $@ -c -MMD $<

$(OBJ)/$(SUBSRC)/%.o: $(SUBSRC)/%.c
	$(CC) $(CFLAG) -o $@ -c -MMD $< 

all: $(TARGET)

.PHONY: clean
clean: 
	$(RM) $(TARGET) $(OBJ)/Src/*.d $(OBJ)/Src/*.o $(OBJ)/Driver/Src/*.d $(OBJ)/Driver/Src/*.o

.PHONY: print
print:
	-@echo $(MAINSRCS)
	-@echo $(MAININCS)
	-@echo $(OBJS)
	-@echo $(SUBSRCS)
	-@echo $(SUBINCS)
	-@echo $(DEPS)