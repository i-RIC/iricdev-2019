##
## init.github_env.ps1
## 
## All version numbers are stored in versions.cmd

if (-Not (Test-Path $PSScriptRoot\programs.prop)) {
    Copy-Item $PSScriptRoot\programs_std.prop $PSScriptRoot\programs.prop
}

# Some builds require underscores instead of decimal points
# they have a _UVER suffix
$uvers = "BOOST", "EXPAT", "OPENSSL"

(Get-Content $PSScriptRoot\versions.cmd) | Foreach-Object {
    if ($_ -imatch "^set (?<var>.*)_VER=(?<val>.*)$") {
        [System.Environment]::SetEnvironmentVariable($matches['var'] + "_VER",$matches['val'])
        Write-Output "$($matches['var'])_VER=$($matches['val'])"
        if ($uvers -contains $matches['var']) {
            [System.Environment]::SetEnvironmentVariable($matches['var'] + "_UVER",$matches['val'].Replace('.', '_'))
            Write-Output "$($matches['var'])_UVER=$($matches['val'].Replace('.', '_'))"
        }
    }
}
