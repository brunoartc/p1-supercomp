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
include CMakeFiles/sequencial_normal.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/sequencial_normal.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/sequencial_normal.dir/flags.make

CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o: CMakeFiles/sequencial_normal.dir/flags.make
CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o: ../src/sequential/sequencial.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/bruno/Documents/p1-supercomp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o -c /home/bruno/Documents/p1-supercomp/src/sequential/sequencial.cpp

CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/bruno/Documents/p1-supercomp/src/sequential/sequencial.cpp > CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.i

CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/bruno/Documents/p1-supercomp/src/sequential/sequencial.cpp -o CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.s

CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o.requires:

.PHONY : CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o.requires

CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o.provides: CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o.requires
	$(MAKE) -f CMakeFiles/sequencial_normal.dir/build.make CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o.provides.build
.PHONY : CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o.provides

CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o.provides.build: CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o


# Object files for target sequencial_normal
sequencial_normal_OBJECTS = \
"CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o"

# External object files for target sequencial_normal
sequencial_normal_EXTERNAL_OBJECTS =

sequencial_normal: CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o
sequencial_normal: CMakeFiles/sequencial_normal.dir/build.make
sequencial_normal: CMakeFiles/sequencial_normal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/bruno/Documents/p1-supercomp/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable sequencial_normal"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/sequencial_normal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/sequencial_normal.dir/build: sequencial_normal

.PHONY : CMakeFiles/sequencial_normal.dir/build

CMakeFiles/sequencial_normal.dir/requires: CMakeFiles/sequencial_normal.dir/src/sequential/sequencial.cpp.o.requires

.PHONY : CMakeFiles/sequencial_normal.dir/requires

CMakeFiles/sequencial_normal.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/sequencial_normal.dir/cmake_clean.cmake
.PHONY : CMakeFiles/sequencial_normal.dir/clean

CMakeFiles/sequencial_normal.dir/depend:
	cd /home/bruno/Documents/p1-supercomp/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/bruno/Documents/p1-supercomp /home/bruno/Documents/p1-supercomp /home/bruno/Documents/p1-supercomp/build /home/bruno/Documents/p1-supercomp/build /home/bruno/Documents/p1-supercomp/build/CMakeFiles/sequencial_normal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/sequencial_normal.dir/depend

