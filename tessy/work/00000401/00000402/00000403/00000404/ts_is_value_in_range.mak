##################################################################
# Makefile generated by TESSY (c)2000
# for Testobject 'is_value_in_range
# DO NOT EDIT
#

SHELL                   = cmd
TESSY_BIN             := C:\PROGRA~1\Razorcat\TESSY_4.2\bin
TESSY_SYS             := C:/PROGRA~1/Razorcat/TESSY_4.2/sys
MODULE_PATH           := C:/Users/Sowjanya/Desktop/GIT_FO~1/tessy\work\00000401\00000402\00000403\00000404
MODULE_PATH_DOS       := C:/Users/Sowjanya/Desktop/GIT_FO~1/tessy\work\00000401\00000402\00000403\00000404
TESTOBJECT            := is_value_in_range
PROJECTROOT           := C:\Users\Sowjanya\Desktop\Git_folder

#
# Default timer file implementation
#
TIMER_FILE            := $(TESSY_SYS)\src\comm\ts_timer.c

COMM_IS_FILE_COMM = false
#
# Variables marked with 'Add to Makefile'
#
BUFFER_SIZE           := 10240
CHECK_CALL_TRACE_SIZE := 
COMM_BUFFER_INTEGRITY := false
COMM_CHECKSUM         := false
COMM_FILE_COMPRESSION := false
COMPILER_DEFINES      := 
COMPILER_DIALECT      := 
COMPILER_INCLUDES     := 
COMPILER_INSTALL_PATH := C:/PROGRA~1/RAZORCAT/SHARED/1.3/MSYS32
DUPLICATED_DEFINES_HEADER:= 
ENABLE_EXCEPTIONS     := true
ENDIANESS             := -
EXEFILE_EXTENSION     := .exe
LINKER_OPTIONS        := 
OBJFILE_EXTENSION     := .o
TARGET_INSTALL_PATH   := 
TIMER_ENABLED         := false
TIMER_FILE            := C:/PROGRA~1/Razorcat/TESSY_4.2/sys/src/comm/ts_timer_gcc.c

USER_LINK_OPTIONS     := 


#####################################################################

#
# Special macros for includes and defines
#
TS_DEF_SEPARATOR :=-D
define TS_DEFINE
$(subst ;, $(TS_DEF_SEPARATOR),$(1))
endef

TS_INC_SEPARATOR :=-I
define TS_INCLUDE
$(subst \,/,$(subst ;, $(TS_INC_SEPARATOR),$(1)))
endef

all	 : check_success master slave

#
S_BUILDIN_TESSY_FLAG := $(wildcard $(MODULE_PATH)/tslows_builtin.tessy)

TS_INCLUDES_FILE := includes
define TS_CREATE_INCLUDES_FILE
$(file >$(TS_INCLUDES_FILE)$(1).txt)
endef
define TS_ADD_TO_INCLUDES_FILE
$(foreach var,$(2),$(file >>$(TS_INCLUDES_FILE)$(1).txt,$(var)))
endef

define TS_ADD_TO_INCLUDE_FILE

endef

check_success :
ifneq ($(S_BUILDIN_TESSY_FLAG),)
	@echo *
	@echo * Obviously the last build failed. Cleaning up built-in files...
	@-ts_rm -f "$(MODULE_PATH)"/tslows_builtin.*
	@echo * Please, try again to generate a built-in target binary.
	@echo *
	@exit 1
endif

#
# MASTER & COMM Makefiles
# (you should not need to modify these settings)
#
M_COMM_MAKE		:=	$(TESSY_SYS)/make/master_socket_gnu_i386.mk
S_COMM_MAKE		:=	$(TESSY_SYS)/src/comm/comm_socket.mk

#
# SLAVE
#
S_CC           := gcc
S_LINK         := gcc
S_INCLUDES     := -I$(TESSY_SYS)/include \
						-I$(TESSY_SYS)/include/tessy \
						-I$(TESSY_SYS)/include/tessy/comm \
						-I$(TESSY_SYS)/include/tpt
S_STUB_OBJECT  := $(MODULE_PATH)/ts_$(TESTOBJECT)_stubs.o
S_UC_OBJECT    := $(MODULE_PATH)/ts_$(TESTOBJECT)_usr.o
S_LIBRARIES    := -lpsapi -lws2_32
S_COMP_OPTIONS := -g $(COMPILER_DIALECT) -Wall -DTS_SLAVE -DTESSY -DTS_SOCKET -DTS_HAVE_INT64 -DTS_HAVE_FLOAT64 -DTS_HAVE_FLOAT96
S_LINK_OPTIONS :=

#####################################################################

#
# Compile Sourcefiles
#
S_SRC_OBJECTS       := $(MODULE_PATH_DOS)\ts_src01.o
USER_INCLUDES01     := ;C:\PROGRA~1\Razorcat\TESSY_4.2\Examples\ISVALU~1
USER_DEFINES01      := 
USER_COMP_OPTIONS01 := 

USER_COMP_OPTIONS   := $(call TS_DEFINE,$(USER_DEFINES01)) $(call TS_INCLUDE,$(USER_INCLUDES01))

$(MODULE_PATH_DOS)\ts_src01$(OBJFILE_EXTENSION): $(MODULE_PATH_DOS)\ts_src01.c
	@echo *
	@echo ***** Compiling Source *****
	$(call TS_CREATE_INCLUDES_FILE,01)
	$(call TS_ADD_TO_INCLUDES_FILE,01,$(S_INCLUDES)$(call TS_INCLUDE,$(USER_INCLUDES01)))
	$(S_CC) $(S_COMP_OPTIONS) $(call TS_DEFINE,$(USER_DEFINES01)$(S_COM_OPTIONS)) \
	$(USER_COMP_OPTIONS01) @$(TS_INCLUDES_FILE)01.txt -c "$<" -o "$@"

#####################################################################

ifneq ($(S_GenerateBuiltinData),)
COMM_CHECKSUM :=
TARGET_FLAG := d
BUILTIN_OBJ := $(MODULE_PATH)/tslows_builtin$(OBJFILE_EXTENSION)
master :
	@-ts_rm -f "$(MODULE_PATH)"/tslows_builtin$(OBJFILE_EXTENSION)
else
BUILTIN_OBJ :=
TARGET_FLAG := s
master : $(MODULE_PATH)/ts_$(TESTOBJECT)$(EVOL)_m.exe
endif
slave  : $(MODULE_PATH)/ts_$(TESTOBJECT)$(EVOL)_$(TARGET_FLAG)$(EXEFILE_EXTENSION)
$(MODULE_PATH)/ts_$(TESTOBJECT)$(EVOL)_$(TARGET_FLAG)$(EXEFILE_EXTENSION) : $(MODULE_PATH)/ts_$(TESTOBJECT)$(EVOL)_m.exe

#
# COMPILE SOURCES
#

#
# COMPILE USERCODE / STUBS / C1-COUNTS
#
$(S_UC_OBJECT) : $(MODULE_PATH)/ts_$(TESTOBJECT)_usr.c
	@echo *
	@echo ***** Compiling Usercode *****
	$(S_CC) $(S_INCLUDES) $(S_COMP_OPTIONS) -c $< -o $@

$(S_STUB_OBJECT) : $(MODULE_PATH)/ts_$(TESTOBJECT)_stubs.c
	@echo *
	@echo ***** Compiling Stubs *****
	$(S_CC) $(S_INCLUDES) $(S_COMP_OPTIONS) -c $< -o $@

#
# COMPILE/LINK MASTER
#

include $(M_COMM_MAKE)


#
# COMPILE SLAVE COMMUNICATION MODULES

include $(S_COMM_MAKE)

#
# Timer Object
ifeq ($(TIMER_ENABLED),true)
S_TIMER_OBJECT := $(MODULE_PATH)/ts_timer.o

$(S_TIMER_OBJECT) : $(TIMER_FILE)
	@echo *
	@echo ***** Compiling Timer File *****
	$(S_CC) $(COMM_OPTIONS) $(COMM_INCLUDES)  -c $< -o $@
endif


#
# COMPILE/LINK SLAVE
#
$(MODULE_PATH)/ts_$(TESTOBJECT)_s.o : $(MODULE_PATH)/ts_$(TESTOBJECT)_s.c
	@echo *
	@echo ***** Compiling Slave *****
	$(S_CC) $(S_INCLUDES) $(S_COMP_OPTIONS) -DTS_SOCKET -c $< -o $@

$(S_TPT_OBJECTS) : $(TESSY_SYS)\src\TPT\TPT__VM.c
	@echo *
	@echo ***** Compiling TPT Module *****
	$(S_CC) $(S_INCLUDES) -I$(TESSY_SYS)/include/TPT $(S_COMP_OPTIONS) -DTS_SOCKET -c $< -o $@

#
# Objects to be delete after the build process.
#
TS_INTERMEDIATE_OBJS := $(BUILTIN_OBJ) $(MODULE_PATH)/ts_$(TESTOBJECT)_s.o $(S_SRC_OBJECTS) \
                        $(S_UC_OBJECT) $(S_STUB_OBJECT) $(S_TIMER_OBJECT) $(COMM_OBJECTS) \
                        $(S_TPT_OBJECTS)
.INTERMEDIATE: $(TS_INTERMEDIATE_OBJS)

$(MODULE_PATH)/ts_$(TESTOBJECT)$(EVOL)_$(TARGET_FLAG).exe : $(TS_INTERMEDIATE_OBJS)
	@echo *
	@echo ***** Linking Slave *****
	$(S_LINK) -o $@ $(TS_INTERMEDIATE_OBJS) $(S_COMP_OPTIONS) $(S_LINK_OPTIONS) $(USER_LINK_OPTIONS) $(S_LIBRARIES)
	@ts_cp $(TESSY_SYS)\templates\manifest.xml.template $@.manifest
ifneq ($(S_GenerateBuiltinData),)
	@-ts_rm "$(MODULE_PATH)"/tslows_builtin.*
	@echo *
	@echo * Generated target binary '$(shell ts_pathname -w $(MODULE_PATH)/ts_$(TESTOBJECT)_$(TARGET_FLAG)$(EXEFILE_EXTENSION))' containing builtin data.
	@echo *
endif

#####################################################################

