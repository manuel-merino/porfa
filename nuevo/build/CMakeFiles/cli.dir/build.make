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
include CMakeFiles/cli.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/cli.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cli.dir/flags.make

CMakeFiles/cli.dir/src/examples/cli.cpp.o: CMakeFiles/cli.dir/flags.make
CMakeFiles/cli.dir/src/examples/cli.cpp.o: ../src/examples/cli.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/cli.dir/src/examples/cli.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/cli.dir/src/examples/cli.cpp.o -c /home/a/NAUDIT/pruebas/dependencies/netlib/src/examples/cli.cpp

CMakeFiles/cli.dir/src/examples/cli.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cli.dir/src/examples/cli.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/a/NAUDIT/pruebas/dependencies/netlib/src/examples/cli.cpp > CMakeFiles/cli.dir/src/examples/cli.cpp.i

CMakeFiles/cli.dir/src/examples/cli.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cli.dir/src/examples/cli.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/a/NAUDIT/pruebas/dependencies/netlib/src/examples/cli.cpp -o CMakeFiles/cli.dir/src/examples/cli.cpp.s

CMakeFiles/cli.dir/src/examples/cli.cpp.o.requires:

.PHONY : CMakeFiles/cli.dir/src/examples/cli.cpp.o.requires

CMakeFiles/cli.dir/src/examples/cli.cpp.o.provides: CMakeFiles/cli.dir/src/examples/cli.cpp.o.requires
	$(MAKE) -f CMakeFiles/cli.dir/build.make CMakeFiles/cli.dir/src/examples/cli.cpp.o.provides.build
.PHONY : CMakeFiles/cli.dir/src/examples/cli.cpp.o.provides

CMakeFiles/cli.dir/src/examples/cli.cpp.o.provides.build: CMakeFiles/cli.dir/src/examples/cli.cpp.o


# Object files for target cli
cli_OBJECTS = \
"CMakeFiles/cli.dir/src/examples/cli.cpp.o"

# External object files for target cli
cli_EXTERNAL_OBJECTS =

bin/cli: CMakeFiles/cli.dir/src/examples/cli.cpp.o
bin/cli: CMakeFiles/cli.dir/build.make
bin/cli: lib/libnetlib.a
bin/cli: lib/libssl.a
bin/cli: lib/libcrypto.a
bin/cli: CMakeFiles/cli.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bin/cli"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cli.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cli.dir/build: bin/cli

.PHONY : CMakeFiles/cli.dir/build

CMakeFiles/cli.dir/requires: CMakeFiles/cli.dir/src/examples/cli.cpp.o.requires

.PHONY : CMakeFiles/cli.dir/requires

CMakeFiles/cli.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cli.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cli.dir/clean

CMakeFiles/cli.dir/depend:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles/cli.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cli.dir/depend

