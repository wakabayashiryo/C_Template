
#command of compile and compile options , remove 
CC = gcc	
CFLAG := -c -g -MMD -MP -Wall -Wextra -Winit-self
RM = rm -f  

#target name
TARGET := test
#directory of headerfiles macross 
INCLUDE := -I Inc -I Driver/Inc

#directory macros
MAINSRC := Src
MAININC :=  Inc
SUBSRC := Driver/Src
SUBINC := Driver/Inc
OBJ := Debug
BIN := bin

MAINSRCS := $(wildcard $(MAINSRC)/*.c)
MAININCS := $(wildcard $(MAININC)/*.h)
OBJS := $(addprefix $(OBJ)/,$(notdir $(MAINSRCS:%.c=%.o)))

SUBSRCS := $(wildcard $(SUBSRC)/*.c)
SUBINCS := $(wildcard $(SUBINC)/*.h)
OBJS += $(addprefix $(OBJ)/,$(notdir $(SUBSRCS:%.c=%.o)))
#dependency file
DEPS := $(OBJS:%.o=%.d)

.PHONY: all clean print	

all: $(BIN)/$(TARGET)

#generate binary-file
$(BIN)/$(TARGET): $(OBJS)
	mkdir -p $(BIN)
	$(CC) -o $@ $^

#sources are generated to objectfile in Maindirectry 
$(OBJ)/%.o: $(MAINSRC)/%.c
	mkdir -p $(OBJ)
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

#sources are generated to objectfile in Subdirectry 
$(OBJ)/%.o: $(SUBSRC)/%.c
	mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $< 

-include $(DEPS) #-includeは.PHONYとallの間に入れないように

#delete object-files binary-files
clean: 
	$(RM) -R $(OBJ) $(BIN) 
	
# disp directory macros
print:
	-@echo 'MAINSRCS=$(MAINSRCS)'
	-@echo 'MAININCS=$(MAININCS)'
	-@echo 'OBJS=$(OBJS)'
	-@echo 'SUBSRCS=$(SUBSRCS)'
	-@echo 'SUBINCS=$(SUBINCS)'
	-@echo 'DEPS=$(DEPS)'
