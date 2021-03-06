include (ExternalProject)

if (onnxruntime_USE_PREINSTALLED_EIGEN)
    add_library(eigen INTERFACE)
    file(TO_CMAKE_PATH ${eigen_SOURCE_PATH} eigen_INCLUDE_DIRS)
    target_include_directories(eigen INTERFACE ${eigen_INCLUDE_DIRS})
else ()
    if (onnxruntime_USE_ACL)
        execute_process(COMMAND  git apply --ignore-space-change --ignore-whitespace ${PROJECT_SOURCE_DIR}/patches/eigen/Fix_Eigen_Build_Break.patch WORKING_DIRECTORY ${PROJECT_SOURCE_DIR})
    endif()
    set(eigen_INCLUDE_DIRS  "${PROJECT_SOURCE_DIR}/external/eigen")
endif()
