## iricdev [![Build status](https://ci.appveyor.com/api/projects/status/vgub5bimojgucmx4?svg=true)](https://ci.appveyor.com/project/i-RIC/iricdev)

Build libraries needed to build iRIC on Linux and Windows

## Windows Visual Studio 2017 Build (Full)
* Visual Studio 2017 available from https://my.visualstudio.com/Downloads?q=visual%20studio%202017&wt.mc_id=o~msft~vscom~older-downloads
* git available from https://git-scm.com/download/win
* Qt 5.14 available from https://www.qt.io/download-qt-installer?hsCtaTracking=99d9dd4f-5681-48d2-b096-470725510d34%7C074ddad0-fdef-4e53-8aa8-5e8a876d6ab4
* 7-zip available from http://www.7-zip.org/
* Add 7-zip installation path to "Path" environment variable.
* NSIS available from http://nsis.sourceforge.net/Download/ (for HDF5 packaging)
* Perl available from https://www.activestate.com/activeperl/downloads (for OpenSSL)
* Tcl available from https://www.activestate.com/activetcl/downloads (if building cgns and hdf5 tools)
* curl available from https://www.nuget.org/packages/curl/ (not required if using the git packaged version)

### in a git bash shell
```
git clone https://github.com/i-RIC/iricdev.git iricdev_2017
cd iricdev_2017
```

copy programs_std.prop to programs.prop and make any necessary changes (ie path to git curl program)

### in a Command Prompt
```
cd iricdev_2017
msbuild_2017.cmd (or msbuild_2017_w_tools.cmd to build cgns and hdf5 tools)
copy paths.pri [prepost-gui-root]\.
copy dirExt.prop [prepost-gui-root]\tools\data\.
mkdir [prepost-gui-root]\libdlls\debug.
mkdir [prepost-gui-root]\libdlls\release.
:: if building tools
add install\cgnslib-[CGNS_VER]\release\bin and install\hdf5-[HDF5_VER]\release\bin to "Path"
```

or if you want to use the VTK_DEBUG_LEAKS configuration

```
cd iricdev_2017
msbuild_2017.cmd (or msbuild_2017_w_tools.cmd to build cgns and hdf5 tools)
copy paths-debug-vtk-leaks.pri [prepost-gui-root]\paths.pri
copy dirExt-debug-vtk-leaks.prop [prepost-gui-root]\tools\data\dirExt.prop
mkdir [prepost-gui-root]\libdlls\debug.
mkdir [prepost-gui-root]\libdlls\release.
:: if building tools
add install\cgnslib-[CGNS_VER]\release\bin and install\hdf5-[HDF5_VER]\release\bin to "Path"
```

## Ubuntu 16.04.2 LTS Build (Full)

* C compiler (gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609)
* C++ compiler (g++ (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609)
* cmake (cmake version 3.5.1)
* wget (GNU Wget 1.17.1 built on linux-gnu)

```
sudo apt-get install gcc g++ gfortran cmake wget libxt-dev qt5-default qttools5-dev libqt5svg5-dev libqt5webkit5-dev m4
git clone https://github.com/i-RIC/iricdev.git iricdev_gcc
cd iricdev_gcc
./download.sh
./build_gcc.sh
```

## Scientific Linux release 6.7 (Carbon) (hdf5, cgns, iriclib)
* C compiler (icc (ICC) 17.0.2 20170213)
* C++ compiler (icpc (ICC) 17.0.2 20170213)
* cmake (cmake version 2.8.12.1)
* wget (GNU Wget 1.12 built on linux-gnu)

```
git clone https://github.com/i-RIC/iricdev.git iricdev_icc
cd iricdev_icc
./download.sh
./build_icc.sh
```
