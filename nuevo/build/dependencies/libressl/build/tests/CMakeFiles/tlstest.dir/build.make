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
include dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/depend.make

# Include the progress variables for this target.
include dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/progress.make

# Include the compile flags for this target's objects.
include dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/flags.make

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o: dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/flags.make
dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o: ../dependencies/libressl/tests/tlstest.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/tlstest.dir/tlstest.c.o   -c /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/tests/tlstest.c

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/tlstest.dir/tlstest.c.i"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/tests/tlstest.c > CMakeFiles/tlstest.dir/tlstest.c.i

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/tlstest.dir/tlstest.c.s"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && /usr/bin/cc  $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/tests/tlstest.c -o CMakeFiles/tlstest.dir/tlstest.c.s

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o.requires:

.PHONY : dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o.requires

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o.provides: dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o.requires
	$(MAKE) -f dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/build.make dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o.provides.build
.PHONY : dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o.provides

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o.provides.build: dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o


# Object files for target tlstest
tlstest_OBJECTS = \
"CMakeFiles/tlstest.dir/tlstest.c.o"

# External object files for target tlstest
tlstest_EXTERNAL_OBJECTS =

bin/tlstest: dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o
bin/tlstest: dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/build.make
bin/tlstest: lib/libtls.a
bin/tlstest: lib/libssl.a
bin/tlstest: lib/libcrypto.a
bin/tlstest: dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C executable ../../../../bin/tlstest"
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/tlstest.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/build: bin/tlstest

.PHONY : dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/build

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/requires: dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/tlstest.c.o.requires

.PHONY : dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/requires

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/clean:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests && $(CMAKE_COMMAND) -P CMakeFiles/tlstest.dir/cmake_clean.cmake
.PHONY : dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/clean

dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/depend:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib/dependencies/libressl/tests /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests /home/a/NAUDIT/pruebas/dependencies/netlib/build/dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dependencies/libressl/build/tests/CMakeFiles/tlstest.dir/depend

