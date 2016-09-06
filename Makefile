

# CC = arm-none-eabi-gcc
CC = gcc
RM = rm -f

TARGET := test
CFLAG := -I Inc

MAINSRC := Src
MAININC := Inc
OBJ := Debug
SUBSRC := Driver/Src
SUBINC := Driver/Inc

MAINSRCS := $(wildcard $(MAINSRC)/*.c)
MAININCS := $(wildcard $(MAININC)/*.h)
OBJS := $(addprefix $(OBJ)/,$(MAINSRCS:%.c=%.o))

SRCS := $(wildcard $(SOURCE)/*.c)
INCS := $(wildcard $(INCLUDE)/*.h)
OBJS := $(addprefix $(OBJECT)/,$(SOURCES:%.c=%.o))

DEPS := $(OBJS:%.o=%.d)

-include $(DEPS)

.PHONY: all

$(TARGET): $(OBJS)
	$(CC) -o $@ $^

$(OBJ)/$(MAINSRC)/%.o: $(MAINSRC)/%.c
	$(CC) $(CFLAG) -o $@ -c -MMD $< 

all: $(TARGET)

.PHONY: clean
clean: 
	$(RM) $(TARGET) $(OBJ)/Src/*.d $(OBJ)/Src/*.o

.PHONY: print
print:
	-@echo $(MAINSRCS)
	-@echo $(MAININCS)
	-@echo $(OBJS)