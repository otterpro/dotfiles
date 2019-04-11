#profile for powershell
# should be $ `$profile.CurrentUserAllHosts`
# `C:\Users\USERNAME\Documents\WindowsPowerShell\profile.ps1`
#function Get-GitStatus { git status $args }
# New-Alias -Name gs -Value Get-GitStatus

#function Set-GitCommit { git commit -am $args }
#New-Alias -Name gc -Value Set-GitCommit


function gs { git status  }
function gpl { git pull }
function gps { git push }
function gaa { git add -A }
function gcm { git commit -m $args}


