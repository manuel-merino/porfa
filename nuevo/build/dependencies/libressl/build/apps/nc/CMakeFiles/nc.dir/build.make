# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.5

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/a/NAUDIT/pruebas/dependencies/netlib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/a/NAUDIT/pruebas/dependencies/netlib/build

# Include any dependencies generated for this target.
include dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/depend.make

# Include the progress variables for this target.
include dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/progress.make

# Include the compile flags for this target's objects.
include dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/flags.make

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/flags.make
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o: ../dependencies/libressl/apps/nc/atomicio.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/nc.dir/atomicio.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/atomicio.c

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nc.dir/atomicio.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/atomicio.c > CMakeFiles/nc.dir/atomicio.c.i

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nc.dir/atomicio.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/atomicio.c -o CMakeFiles/nc.dir/atomicio.c.s

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o.requires:

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o.requires

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o.provides: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o.requires
	$(MAKE) -f dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build.make dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o.provides.build
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o.provides

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o.provides.build: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o


dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/flags.make
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o: ../dependencies/libressl/apps/nc/netcat.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/nc.dir/netcat.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/netcat.c

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nc.dir/netcat.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/netcat.c > CMakeFiles/nc.dir/netcat.c.i

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nc.dir/netcat.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/netcat.c -o CMakeFiles/nc.dir/netcat.c.s

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o.requires:

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o.requires

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o.provides: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o.requires
	$(MAKE) -f dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build.make dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o.provides.build
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o.provides

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o.provides.build: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o


dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/flags.make
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o: ../dependencies/libressl/apps/nc/socks.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/nc.dir/socks.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/socks.c

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nc.dir/socks.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/socks.c > CMakeFiles/nc.dir/socks.c.i

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nc.dir/socks.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/socks.c -o CMakeFiles/nc.dir/socks.c.s

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o.requires:

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o.requires

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o.provides: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o.requires
	$(MAKE) -f dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build.make dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o.provides.build
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o.provides

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o.provides.build: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o


dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/flags.make
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o: ../dependencies/libressl/apps/nc/compat/socket.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/nc.dir/compat/socket.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/socket.c

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nc.dir/compat/socket.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/socket.c > CMakeFiles/nc.dir/compat/socket.c.i

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nc.dir/compat/socket.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/socket.c -o CMakeFiles/nc.dir/compat/socket.c.s

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o.requires:

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o.requires

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o.provides: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o.requires
	$(MAKE) -f dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build.make dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o.provides.build
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o.provides

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o.provides.build: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o


dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/flags.make
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o: ../dependencies/libressl/apps/nc/compat/base64.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/nc.dir/compat/base64.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/base64.c

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nc.dir/compat/base64.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/base64.c > CMakeFiles/nc.dir/compat/base64.c.i

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nc.dir/compat/base64.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/base64.c -o CMakeFiles/nc.dir/compat/base64.c.s

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o.requires:

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o.requires

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o.provides: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o.requires
	$(MAKE) -f dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build.make dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o.provides.build
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o.provides

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o.provides.build: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o


dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/flags.make
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o: ../dependencies/libressl/apps/nc/compat/readpassphrase.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/nc.dir/compat/readpassphrase.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/readpassphrase.c

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nc.dir/compat/readpassphrase.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/readpassphrase.c > CMakeFiles/nc.dir/compat/readpassphrase.c.i

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nc.dir/compat/readpassphrase.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/readpassphrase.c -o CMakeFiles/nc.dir/compat/readpassphrase.c.s

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o.requires:

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o.requires

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o.provides: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o.requires
	$(MAKE) -f dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build.make dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o.provides.build
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o.provides

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o.provides.build: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o


dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/flags.make
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o: ../dependencies/libressl/apps/nc/compat/strtonum.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/nc.dir/compat/strtonum.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/strtonum.c

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/nc.dir/compat/strtonum.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/strtonum.c > CMakeFiles/nc.dir/compat/strtonum.c.i

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/nc.dir/compat/strtonum.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc/compat/strtonum.c -o CMakeFiles/nc.dir/compat/strtonum.c.s

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o.requires:

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o.requires

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o.provides: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o.requires
	$(MAKE) -f dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build.make dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o.provides.build
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o.provides

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o.provides.build: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o


# Object files for target nc
nc_OBJECTS = \
"CMakeFiles/nc.dir/atomicio.c.o" \
"CMakeFiles/nc.dir/netcat.c.o" \
"CMakeFiles/nc.dir/socks.c.o" \
"CMakeFiles/nc.dir/compat/socket.c.o" \
"CMakeFiles/nc.dir/compat/base64.c.o" \
"CMakeFiles/nc.dir/compat/readpassphrase.c.o" \
"CMakeFiles/nc.dir/compat/strtonum.c.o"

# External object files for target nc
nc_EXTERNAL_OBJECTS =

bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o
bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o
bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o
bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o
bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o
bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o
bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o
bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build.make
bin/nc: lib/libtls.a
bin/nc: lib/libtls.a
bin/nc: lib/libssl.a
bin/nc: lib/libcrypto.a
bin/nc: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking C executable ../../../../../bin/nc"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build: bin/nc

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/build

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/requires: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/atomicio.c.o.requires
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/requires: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/netcat.c.o.requires
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/requires: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/socks.c.o.requires
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/requires: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/socket.c.o.requires
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/requires: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/base64.c.o.requires
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/requires: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/readpassphrase.c.o.requires
dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/requires: dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/compat/strtonum.c.o.requires

.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/requires

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/clean:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc && $(CMAKE_COMMAND) -P CMakeFiles/nc.dir/cmake_clean.cmake
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/clean

dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/depend:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/apps/nc /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dependencies/libressl/build/apps/nc/CMakeFiles/nc.dir/depend

