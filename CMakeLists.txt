cmake_minimum_required(VERSION 3.10)

# set the project name
project(Prova)

enable_language(C)

#====================== SEQUENCIAL ===================================================
add_executable(sequencial_normal src/sequential/sequencial.cpp)

target_compile_options(sequencial_normal PUBLIC -O3 -ffast-math -ftree-vectorize -mavx)

#====================== LOCAL ===================================================

add_executable(local_normal src/local/local.cpp)

target_compile_options(local_normal PUBLIC -O3 -ffast-math -ftree-vectorize -mavx)

#====================== BRANCHNBOUND ===================================================

add_executable(bb_normal src/branchnbound/novo-bb.cpp)

target_compile_options(bb_normal PUBLIC -O3 -ffast-math -ftree-vectorize -mavx)








#================****** PARALELO ******===========================================

find_package(OpenMP REQUIRED)

#====================== SEQUENCIAL ===================================================

add_executable(sequencial_paralelo src/sequential/sequencial-para.cpp)

target_link_libraries(sequencial_paralelo PUBLIC OpenMP::OpenMP_CXX)

target_compile_options(sequencial_paralelo PUBLIC -O3 -ffast-math -ftree-vectorize -mavx)

#====================== LOCAL ===================================================

add_executable(local_paralelo src/local/local-para.cpp)

target_link_libraries(local_paralelo PUBLIC OpenMP::OpenMP_CXX)

target_compile_options(local_paralelo PUBLIC -O3 -ffast-math -ftree-vectorize -mavx)












#=========== GPU ========================================================
find_package(CUDA REQUIRED)
set(CUDA_PROPAGATE_HOST_FLAGS OFF)
SET(CUDA_HOST_COMPILER /usr/bin/g++-6)

cuda_add_executable(
    local_gpu
    src/local/local-thrust.cu
)