@echo off
setlocal
set topdir=%~dp0
set topdir=%topdir:\=/%
call versions.cmd
for /f "tokens=1 delims=." %%a in ("%VTK_VER%") do set VTK_MAJOR_VERSION=%%a
for /f "tokens=2 delims=." %%a in ("%VTK_VER%") do set VTK_MINOR_VERSION=%%a
for /f "tokens=1,2 delims=." %%a in ("%VTK_VER%") do set VTK_MAJ_MIN=%%a.%%b
@echo.CONFIG^(debug, debug^|release^) {
@echo.	# gdal
@echo.	LIBS += -L"%topdir%lib/install/gdal-%GDAL_VER%/debug/lib"
@echo.
@echo.	# vtk
if "%DEBUG_LEAKS%"=="YES" (
  @echo.	LIBS += -L"%topdir%lib/install/vtk-%VTK_VER%/debug-vtk-leaks/lib"
) else (
  @echo.	LIBS += -L"%topdir%lib/install/vtk-%VTK_VER%/debug/lib"
)
@echo.
@echo.	# iriclib
@echo.	LIBS += -L"%topdir%lib/install/iriclib-%IRICLIB_VER%/lib"
@echo.
@echo.	# Qwt
@echo.	LIBS += -L"%topdir%lib/install/qwt-%QWT_VER%/lib"
@echo.
@echo.	# proj.4
@echo.	LIBS += -L"%topdir%lib/install/proj-%PROJ_VER%/debug/lib"
@echo.
@echo.	# shapefile
@echo.	LIBS += -L"%topdir%lib/install/shapelib-%SHAPELIB_VER%/debug"
@echo.
@echo.	# hdf5
@echo.	LIBS += -L"%topdir%lib/install/hdf5-%HDF5_VER%/lib"
@echo.
@echo.	# netcdf
@echo.	LIBS += -L"%topdir%lib/install/netcdf-c-%NETCDF_VER%/debug/lib"
@echo.
@echo.	# geos
@echo.	LIBS += -L"%topdir%lib/install/geos-%GEOS_VER%/debug/lib"
@echo.
@echo.	# yaml-cpp
@echo.	LIBS += -L"%topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/debug/lib"
@echo.
@echo.	# udunits
@echo.	LIBS += -L"%topdir%lib/install/udunits-%UDUNITS_VER%/debug/lib"
@echo.
@echo.	# libpng
@echo.	LIBS += -L"%topdir%lib/install/libpng-%LIBPNG_VER%/debug/lib"
@echo.}
@echo.else {
@echo.	# gdal
@echo.	LIBS += -L"%topdir%lib/install/gdal-%GDAL_VER%/release/lib"
@echo.
@echo.	# vtk
@echo.	LIBS += -L"%topdir%lib/install/vtk-%VTK_VER%/release/lib"
@echo.
@echo.	# iriclib
@echo.	LIBS += -L"%topdir%lib/install/iriclib-%IRICLIB_VER%/lib"
@echo.
@echo.	# Qwt
@echo.	LIBS += -L"%topdir%lib/install/qwt-%QWT_VER%/lib"
@echo.
@echo.	# proj.4
@echo.	LIBS += -L"%topdir%lib/install/proj-%PROJ_VER%/release/lib"
@echo.
@echo.	# shapefile
@echo.	LIBS += -L"%topdir%lib/install/shapelib-%SHAPELIB_VER%/release"
@echo.
@echo.	# hdf5
@echo.	LIBS += -L"%topdir%lib/install/hdf5-%HDF5_VER%/lib"
@echo.
@echo.	# netcdf
@echo.	LIBS += -L"%topdir%lib/install/netcdf-c-%NETCDF_VER%/release/lib"
@echo.
@echo.	# geos
@echo.	LIBS += -L"%topdir%lib/install/geos-%GEOS_VER%/release/lib"
@echo.
@echo.	# yaml-cpp
@echo.	LIBS += -L"%topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/release/lib"
@echo.
@echo.	# udunits
@echo.	LIBS += -L"%topdir%lib/install/udunits-%UDUNITS_VER%/release/lib"
@echo.
@echo.	# libpng
@echo.	LIBS += -L"%topdir%lib/install/libpng-%LIBPNG_VER%/release/lib"
@echo.}
@echo.
@echo.INCLUDEPATH += .
@echo.
@echo.# gdal
@echo.INCLUDEPATH += "%topdir%lib/install/gdal-%GDAL_VER%/debug/include"
@echo.
@echo.# vtk
if "%DEBUG_LEAKS%"=="YES" (
  @echo.INCLUDEPATH += "%topdir%lib/install/vtk-%VTK_VER%/debug-vtk-leaks/include/vtk-%VTK_MAJ_MIN%"
) else (
  @echo.INCLUDEPATH += "%topdir%lib/install/vtk-%VTK_VER%/debug/include/vtk-%VTK_MAJ_MIN%"
)
@echo.
@echo.# hdf5
@echo.INCLUDEPATH += "%topdir%lib/install/hdf5-%HDF5_VER%/include"
@echo.
@echo.# iriclib
@echo.INCLUDEPATH += "%topdir%lib/install/iriclib-%IRICLIB_VER%/include"
@echo.
@echo.# Qwt
@echo.INCLUDEPATH += "%topdir%lib/install/qwt-%QWT_VER%/include"
@echo.
@echo.# shapelib
@echo.INCLUDEPATH += "%topdir%lib/install/shapelib-%SHAPELIB_VER%/release"
@echo.
@echo.# poco
@echo.LIBS += -L"%topdir%lib/install/poco-%POCO_VER%/lib"
@echo.INCLUDEPATH += "%topdir%lib/install/poco-%POCO_VER%/include"
@echo.
@echo.# proj.4
@echo.INCLUDEPATH += "%topdir%lib/install/proj-%PROJ_VER%/release/include"
@echo.
@echo.# netcdf
@echo.INCLUDEPATH += "%topdir%lib/install/netcdf-c-%NETCDF_VER%/release/include"
@echo.
@echo.# geos
@echo.INCLUDEPATH += "%topdir%lib/install/geos-%GEOS_VER%/release/include"
@echo.
@echo.# yaml-cpp
@echo.INCLUDEPATH += "%topdir%lib/install/yaml-cpp-%YAML_CPP_VER%/release/include"
@echo.
@echo.# udunits
@echo.INCLUDEPATH += "%topdir%lib/install/udunits-%UDUNITS_VER%/release/include"
@echo.
@echo.# libpng
@echo.INCLUDEPATH += "%topdir%lib/install/libpng-%LIBPNG_VER%/release/include"
@echo.
@echo.# boost
if "%APPVEYOR_BUILD_FOLDER%"=="" (
  @echo.INCLUDEPATH += "%topdir%lib/install/boost-%BOOST_VER%"
) else (
  @echo.INCLUDEPATH += "C:/Libraries/boost_%BOOST_UVER%"
)
@echo.
@echo.#internal libs
@echo.INCLUDEPATH += "$$PWD/libs"
@echo.
@echo.CONFIG += c++11
@echo.
@echo.target.path = /usr/local/iRIC
@echo.INSTALLS += target
@echo.
@echo.VTK_MAJOR_VERSION = %VTK_MAJOR_VERSION%
@echo.VTK_MINOR_VERSION = %VTK_MINOR_VERSION%
@echo.
@echo.VTK_MAJ_MIN = $${VTK_MAJOR_VERSION}.$${VTK_MINOR_VERSION}
endlocal
