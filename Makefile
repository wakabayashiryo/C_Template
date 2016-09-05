
# CC = arm-none-eabi-gcc
CC = gcc
RM = rm -f

TARGET := test
CFLAG := -I Inc

SOURCE := Src
INCLUDE := Inc
OBJECT := Debug
DRIVERSOURCE := Driver/Src
DRIVERINCLUDE := Driver/Inc

SOURCES := $(wildcard $(SOURCE)/*.c)
INCLUDES := $(wildcard $(INCLUDE)/*.h)
OBJECTS := $(addprefix $(OBJECT)/,$(SOURCES:%.c=%.o))

DEPENDS := $(OBJECTS:%.o=%.d)

-include $(DEPENDS)

.PHONY: all

$(TARGET): $(OBJECTS)
	-@echo $(SOURCES)
	-@echo $(INCLUDES)
	-@echo $(OBJECTS)
	$(CC) -o $@ $^

$(OBJECT)/$(SOURCE)/%.o: $(SOURCE)/%.c
	$(CC) $(CFLAG) -o $@ -c -MMD $< 

all: $(TARGET)

.PHONY: clean
clean: 
	$(RM) $(TARGET) $(OBJECT)/Src/*.d $(OBJECT)/Src/*.o