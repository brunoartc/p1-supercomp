# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

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
CMAKE_SOURCE_DIR = /home/bruno/Documents/p1-supercomp

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/bruno/Documents/p1-supercomp/build

# Include any dependencies generated for this target.
include CMakeFiles/local_paralelo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/local_paralelo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/local_paralelo.dir/flags.make

CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o: CMakeFiles/local_paralelo.dir/flags.make
CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o: ../src/local/local-para.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bruno/Documents/p1-supercomp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o -c /home/bruno/Documents/p1-supercomp/src/local/local-para.cpp

CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bruno/Documents/p1-supercomp/src/local/local-para.cpp > CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.i

CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bruno/Documents/p1-supercomp/src/local/local-para.cpp -o CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.s

CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o.requires:

.PHONY : CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o.requires

CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o.provides: CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o.requires
	$(MAKE) -f CMakeFiles/local_paralelo.dir/build.make CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o.provides.build
.PHONY : CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o.provides

CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o.provides.build: CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o


# Object files for target local_paralelo
local_paralelo_OBJECTS = \
"CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o"

# External object files for target local_paralelo
local_paralelo_EXTERNAL_OBJECTS =

local_paralelo: CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o
local_paralelo: CMakeFiles/local_paralelo.dir/build.make
local_paralelo: /usr/lib/gcc/x86_64-linux-gnu/7/libgomp.so
local_paralelo: /usr/lib/x86_64-linux-gnu/libpthread.so
local_paralelo: CMakeFiles/local_paralelo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bruno/Documents/p1-supercomp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable local_paralelo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/local_paralelo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/local_paralelo.dir/build: local_paralelo

.PHONY : CMakeFiles/local_paralelo.dir/build

CMakeFiles/local_paralelo.dir/requires: CMakeFiles/local_paralelo.dir/src/local/local-para.cpp.o.requires

.PHONY : CMakeFiles/local_paralelo.dir/requires

CMakeFiles/local_paralelo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/local_paralelo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/local_paralelo.dir/clean

CMakeFiles/local_paralelo.dir/depend:
	cd /home/bruno/Documents/p1-supercomp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bruno/Documents/p1-supercomp /home/bruno/Documents/p1-supercomp /home/bruno/Documents/p1-supercomp/build /home/bruno/Documents/p1-supercomp/build /home/bruno/Documents/p1-supercomp/build/CMakeFiles/local_paralelo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/local_paralelo.dir/depend
