##
## versions.ps1
## 
## All version numbers are stored in versions.cmd


# Some builds require underscores instead of decimal points
# they have a _UVER suffix
$uvers = "BOOST", "EXPAT", "OPENSSL"

(Get-Content "$PSScriptRoot\versions.cmd") | Foreach-Object {
    if ($_ -imatch "^set (?<var>.*)_VER=(?<val>.*)$") {
        [System.Environment]::SetEnvironmentVariable($matches['var'] + "_VER",$matches['val'])
        if ($uvers -contains $matches['var']) {
            [System.Environment]::SetEnvironmentVariable($matches['var'] + "_UVER",$matches['val'].Replace('.', '_'))
        }
    }
}

if (-Not (Test-Path env:BUILD_TOOLS)) { $env:BUILD_TOOLS="OFF" }

## nmake cannot create environment variables
if (-Not (Test-Path env:GENERATOR)) { $env:GENERATOR="Visual Studio 16 2019" }
if (-Not (Test-Path env:SGEN))      { $env:SGEN="vs2019-x64" }
$env:VERSIONS_PS1_RUN="YES"
