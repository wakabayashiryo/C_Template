#command of compile and compile options , remove 
CC = gcc	
CFLAG := -c -g -MMD -MP -Wall -Wextra -Winit-self
RM = rm -f -R 

#target name
TARGET := test
			
#directory macros
SRCDIR := Src
INCDIR := Inc
LIBDIR := lib
LIBSRC := $(shell find $(LIBDIR) -name Src)
OBJ := Debug
BIN := Bin


SRCF := $(wildcard $(SRCDIR)/*.c)
LIBSRCF := $(foreach dir,$(LIBSRC),$(wildcard $(dir)/*.c))
OBJF := $(addprefix $(OBJ)/,$(notdir $(SRCF:%.c=%.o)))\
	 $(addprefix $(OBJ)/,$(notdir $(LIBSRCF:%.c=%.o)))
#directory of headerfiles macross 
INCLUDE :=  -I Inc \
		$(addprefix -I ,$(shell find lib -name Inc))
		
#dependency file
DEPF := $(OBJF:%.o=%.d)

.PHONY: all clean print	

all: $(BIN)/$(TARGET)

#generate binary-file
$(BIN)/$(TARGET): $(OBJF)
	@mkdir -p $(BIN)
	$(CC) -o $@ $^

#sources are generated to objectfile in Maindirectry 
$(OBJ)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(OBJ)
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

#sources are generated to objectfile in Subdirectry 
$(OBJ)/%.o: $(word 1,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 2,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 3,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 4,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 5,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 6,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 7,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 8,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 9,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

$(OBJ)/%.o: $(word 10,$(LIBSRC))/%.c
	@mkdir -p $(OBJ)	
	$(CC) $(CFLAG) $(INCLUDE) -o $@ $<

-include $(DEPF) #-includeは.PHONYとallの間に入れないように

#delete object binary directries
clean: 
	$(RM) $(OBJ) $(BIN) 