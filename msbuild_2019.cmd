@echo off
setlocal enableextensions
pushd .
@REM call "C:\Qt\5.15.0\msvc2019_64\bin\qtenv2.bat"
call "C:\Qt\5.14.2\msvc2017_64\bin\qtenv2.bat"
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\VC\Auxiliary\Build\vcvars64.bat"
set PATH=%PATH%;C:\Qt\Tools\Ninja
popd
call versions.cmd
set GENERATOR="Visual Studio 16 2019"
set SGEN=vs2019-x64
@REM set GENERATOR="Ninja Multi-Config"
@REM set SGEN=ninja-x64
msbuild -noLogo -maxCpuCount -v:d -p:UseDeps=Yes -target:all iricdev.proj
endlocal
