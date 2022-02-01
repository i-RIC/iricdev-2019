##
## versions.github_env.ps1
## 
## All version numbers are stored in versions.cmd


# Some builds require underscores instead of decimal points
# they have a _UVER suffix
$uvers = "BOOST", "EXPAT", "OPENSSL"

(Get-Content .\versions.cmd) | Foreach-Object {
    if ($_ -imatch "^set (?<var>.*)_VER=(?<val>.*)$") {
        Write-Output "$($matches['var'])_VER=$($matches['val'])"
        if ($uvers -contains $matches['var']) {
            [System.Environment]::SetEnvironmentVariable($matches['var'] + "_UVER",$matches['val'].Replace('.', '_'))
            Write-Output "$($matches['var'])_UVER=$($matches['val'].Replace('.', '_'))"
        }
    }
}
