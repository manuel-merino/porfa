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
include dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/depend.make

# Include the progress variables for this target.
include dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/progress.make

# Include the compile flags for this target's objects.
include dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/flags.make

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o: dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/flags.make
dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o: ../dependencies/libressl/tests/rc4test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rc4test.dir/rc4test.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/tests/rc4test.c

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rc4test.dir/rc4test.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/tests/rc4test.c > CMakeFiles/rc4test.dir/rc4test.c.i

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rc4test.dir/rc4test.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/tests/rc4test.c -o CMakeFiles/rc4test.dir/rc4test.c.s

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o.requires:

.PHONY : dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o.requires

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o.provides: dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o.requires
	$(MAKE) -f dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/build.make dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o.provides.build
.PHONY : dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o.provides

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o.provides.build: dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o


# Object files for target rc4test
rc4test_OBJECTS = \
"CMakeFiles/rc4test.dir/rc4test.c.o"

# External object files for target rc4test
rc4test_EXTERNAL_OBJECTS =

bin/rc4test: dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o
bin/rc4test: dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/build.make
bin/rc4test: lib/libtls.a
bin/rc4test: lib/libssl.a
bin/rc4test: lib/libcrypto.a
bin/rc4test: dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../../bin/rc4test"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rc4test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/build: bin/rc4test

.PHONY : dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/build

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/requires: dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/rc4test.c.o.requires

.PHONY : dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/requires

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/clean:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/rc4test.dir/cmake_clean.cmake
.PHONY : dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/clean

dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/depend:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/tests /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dependencies/libressl/build/tests/CMakeFiles/rc4test.dir/depend

