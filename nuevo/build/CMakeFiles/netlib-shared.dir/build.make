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
include CMakeFiles/netlib-shared.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/netlib-shared.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/netlib-shared.dir/flags.make

# Object files for target netlib-shared
netlib__shared_OBJECTS =

# External object files for target netlib-shared
netlib__shared_EXTERNAL_OBJECTS = \
"/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles/netlib_obj.dir/src/netlib_inline.c.o" \
"/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles/netlib_obj.dir/src/netlib.c.o" \
"/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles/netlib_obj.dir/src/netlibpp.cpp.o"

lib/libnetlib.so: CMakeFiles/netlib_obj.dir/src/netlib_inline.c.o
lib/libnetlib.so: CMakeFiles/netlib_obj.dir/src/netlib.c.o
lib/libnetlib.so: CMakeFiles/netlib_obj.dir/src/netlibpp.cpp.o
lib/libnetlib.so: CMakeFiles/netlib-shared.dir/build.make
lib/libnetlib.so: lib/libssl.so.43.2.0
lib/libnetlib.so: lib/libcrypto.so.41.1.0
lib/libnetlib.so: CMakeFiles/netlib-shared.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Linking CXX shared library lib/libnetlib.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/netlib-shared.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/netlib-shared.dir/build: lib/libnetlib.so

.PHONY : CMakeFiles/netlib-shared.dir/build

CMakeFiles/netlib-shared.dir/requires:

.PHONY : CMakeFiles/netlib-shared.dir/requires

CMakeFiles/netlib-shared.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/netlib-shared.dir/cmake_clean.cmake
.PHONY : CMakeFiles/netlib-shared.dir/clean

CMakeFiles/netlib-shared.dir/depend:
	cd /home/a/NAUDIT/pruebas/dependencies/netlib/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build /home/a/NAUDIT/pruebas/dependencies/netlib/build/CMakeFiles/netlib-shared.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/netlib-shared.dir/depend
