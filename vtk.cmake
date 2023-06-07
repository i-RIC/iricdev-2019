set(CTEST_BUILD_NAME "$ENV{SGEN}-vtk")

set(CTEST_SITE "$ENV{COMPUTERNAME}")

set(VER "$ENV{VTK_VER}")
set(CTEST_SOURCE_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/src/VTK-${VER}")
set(CTEST_BINARY_DIRECTORY "${CTEST_SCRIPT_DIRECTORY}/lib/build/vtk-${VER}/${CONF_DIR}")

# Cache file:
  # CMAKE_INSTALL_PREFIX:PATH=C:/Users/charlton/source/repos/iricdev_2019/lib/src/VTK-8.2.0/_vs2019_qt-5.14.2_release/INSTALL
  # CMAKE_CXX_MP_FLAG:BOOL=1
# VTK_QT_VERSION:STRING=5
# VTK_RENDERING_BACKEND:STRING=OpenGL2
# VTK_SMP_IMPLEMENTATION_TYPE:STRING=Sequential               MAYBE OpenMP
# VTK_MAX_THREADS:STRING=64
  # Qt5Widgets_DIR:PATH=C:/Qt/5.14.2/msvc2017_64/lib/cmake/Qt5Widgets
  # Qt5Core_DIR:PATH=C:/Qt/5.14.2/msvc2017_64/lib/cmake/Qt5Core
  # VTK_Group_Qt:BOOL=1
  # Qt5_DIR:PATH=C:/Qt/5.14.2/msvc2017_64/lib/cmake/Qt5
  # CMAKE_CXX_MP_NUM_PROCESSORS:STRING=24
# VTK_PYTHON_VERSION:STRING=2
  # Module_vtkGUISupportQtOpenGL:BOOL=1

set(BUILD_OPTIONS 
-DCMAKE_INSTALL_PREFIX:PATH=${CTEST_SCRIPT_DIRECTORY}/lib/install/vtk-${VER}/${CONF_DIR}
-DCMAKE_CXX_MP_FLAG:BOOL=ON
-DCMAKE_CXX_MP_NUM_PROCESSORS:STRING=$ENV{NUMBER_OF_PROCESSORS}
-DVTK_Group_Qt:BOOL=ON
-DModule_vtkGUISupportQtOpenGL:BOOL=ON
-DModule_vtkIOExportOpenGL2:BOOL=ON
)
# -DModule_vtkGUISupportQt:BOOL=ON
# -DModule_vtkGUISupportQtOpenGL:BOOL=ON
# -DModule_vtkRenderingQt:BOOL=ON
# -DModule_vtkViewsQt:BOOL=ON
# -DVTK_QT_VERSION:STRING=5

if("${CONF_DIR}" STREQUAL "debug-vtk-leaks")
  list(APPEND BUILD_OPTIONS "-DVTK_DEBUG_LEAKS:BOOL=ON")
endif()

if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
  set(PREFIX_PATH "$ENV{HOME}/Qt5.5.1/5.5/gcc_64")
  list(APPEND BUILD_OPTIONS "-DCMAKE_PREFIX_PATH:PATH=${PREFIX_PATH}")
  list(APPEND BUILD_OPTIONS "-DCMAKE_C_FLAGS:STRING=-DGLX_GLXEXT_LEGACY")
  list(APPEND BUILD_OPTIONS "-DCMAKE_CXX_FLAGS:STRING=-DGLX_GLXEXT_LEGACY")
endif()

CTEST_START("Experimental")
CTEST_CONFIGURE(BUILD "${CTEST_BINARY_DIRECTORY}"
                OPTIONS "${BUILD_OPTIONS}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}")
CTEST_BUILD(BUILD "${CTEST_BINARY_DIRECTORY}" TARGET install)
