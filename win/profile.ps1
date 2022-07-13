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
function gadd { git add -A }
function gcm { git commit -m $args}

# function v {gvim $args}
# -p --remote... allows opening text file into same instance with new tabs
#function oldv {gvim.exe -p --remote-tab-silent $args}
function v {
    if ($args.count) {
        gvim.exe -p --remote-tab-silent $args
    }
    else {
        gvim.exe
    }
}

# emacs or console vim for now?
function e { vim.exe $args}

# neovim implementations, flavor of the day
# nvim-qt, neovide, etc...
function n { nvim-qt.exe $args}

# starship prompt
#function Invoke-Starship-PreCommand {
#  $host.ui.Write("`e]0; PS> $env:USERNAME@$env:COMPUTERNAME`: $pwd `a")
#}
#Invoke-Expression (&starship init powershell)
