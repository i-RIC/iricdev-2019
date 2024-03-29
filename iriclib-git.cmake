set(CTEST_PROJECT_NAME "iriclib-git")
set(CTEST_BUILD_NAME "$ENV{SGEN}-iriclib-git")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(HDF5_VER "$ENV{HDF5_VER}")
set(POCO_VER "$ENV{POCO_VER}")

set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/iriclib-git")
if(${CONF_DIR} STREQUAL "debug")
  set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/iriclib-git/_build_debug")
else()
  set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/iriclib-git/_build_release")
endif()

# build PREFIX_PATH (Note the escaped semicolon)
if (WIN32)
  set(PREFIX_PATH "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/cmake/hdf5")
else()
  set(PREFIX_PATH "${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${HDF5_VER}/share/cmake/hdf5")
endif()
set(PREFIX_PATH "${PREFIX_PATH}\;${CTEST_SCRIPT_DIRECTORY}/lib/install/poco-${POCO_VER}/lib/cmake/Poco")

# override LIBDIR to be consistent w/ hdf5
set(BUILD_OPTIONS 
"-DCMAKE_INSTALL_PREFIX:PATH=${CTEST_BINARY_DIRECTORY}/INSTALL"
"-DCMAKE_PREFIX_PATH:PATH=${PREFIX_PATH}"
"-DCMAKE_INSTALL_LIBDIR:PATH=lib"
"-DIRICLIB_FORTRAN_TESTING:BOOL=OFF"
)

# Start
ctest_start("Experimental")

# Configure
ctest_configure(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}"
                CAPTURE_CMAKE_ERROR configure_error)
if(configure_error)
  message(FATAL_ERROR "*** Configure failed ***")
endif()

# Build
ctest_build(BUILD "${CTEST_BINARY_DIRECTORY}"
            CAPTURE_CMAKE_ERROR build_error)
if(build_error)
  message(FATAL_ERROR "*** Build failed ***")
endif()

# Test
ctest_test(RETURN_VALUE return_value
           CAPTURE_CMAKE_ERROR test_error)
if(test_error OR return_value)
  message(FATAL_ERROR "*** Test failed ***")
endif()

# Install
ctest_build(BUILD "${CTEST_BINARY_DIRECTORY}"
            TARGET install
            CAPTURE_CMAKE_ERROR install_error)
if(install_error)
  message(FATAL_ERROR "*** Install failed ***")
endif()
