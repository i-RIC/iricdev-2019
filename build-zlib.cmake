set(CTEST_BUILD_NAME "$ENV{SGEN}-zlib")
set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(VER "$ENV{HDF5-VER}")
set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/hdf5-${VER}/ZLib")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/build/hdf5-${VER}/ZLib")

set(BUILD_OPTIONS 
-DCMAKE_INSTALL_PREFIX:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${VER}/ZLib/${CONF_DIR}
-DCMAKE_LIBRARY_OUTPUT_DIRECTORY:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${VER}/ZLib/${CONF_DIR}/bin
-DCMAKE_RUNTIME_OUTPUT_DIRECTORY:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/hdf5-${VER}/ZLib/${CONF_DIR}/bin
-DMSVC12_REDIST_DIR:PATH=C:/Program\ Files\ \(x86\)/Microsoft\ Visual\ Studio\ 12.0/VC/redist
-DBUILD_SHARED_LIBS:BOOL=ON
)

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET INSTALL)