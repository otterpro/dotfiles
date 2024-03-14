#profile for powershell
# should be $ `$profile.CurrentUserAllHosts`
# `C:\Users\USERNAME\Documents\WindowsPowerShell\profile.ps1`

### env var ###################################
### $EDITOR: used by broot to find editor
$env:EDITOR="gvim"

### function ##################################
#function Get-GitStatus { git status $args }
# New-Alias -Name gs -Value Get-GitStatus

#function Set-GitCommit { git commit -am $args }
#New-Alias -Name gc -Value Set-GitCommit

function g { git }
function gd { git diff }
function gs { git status  }
function gpl { git pull }
function gps { git push }
function gadd { git add -A }
function gcm { git commit -m $args}
function gac { git add -A; git commit -m $args}


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

# touch
function touch { New-Item -ItemType file $args}

###############
# fzf + bat + rg (https://news.ycombinator.com/item?id=38471822)
$env:EDITOR="C:\Program Files\Neovide\neovide.exe"
    # semi-permanent way to set EDITOR
    # use Add-Content for more permanent
    # vim works, but gvim doesn't work (file extension is not added for some reason)
function frg {
    $result = rg --ignore-case --color=always --line-number --no-heading @Args |
      fzf --ansi `
          --color 'hl:-1:underline,hl+:-1:underline:reverse' `
          --delimiter ':' `
          --preview "bat --color=always {1} --theme='Solarized (light)' --highlight-line {2}" `
          --preview-window 'up,60%,border-bottom,+{2}+3/3,~3'
    if ($result) {
      & ($env:EDITOR).Trim("`"'") $result.Split(': ')[0]
    }
  }

# z
Import-Module z

# zoxide -- doesn't work?  
# $result = Get-Command -ErrorAction Ignore -Type Application zoxide.exe
# if ($result) {
#     Invoke-Expression (& { (zoxide init powershell | Out-String) })
# }

# tere
#function Invoke-Tere() {
#    $result = . (Get-Command -CommandType Application tere.exe) $args
#    if ($result) {
#        Set-Location $result
#    }
#}
#Set-Alias zz Invoke-Tere

# starship prompt
#function Invoke-Starship-PreCommand {
#  $host.ui.Write("`e]0; PS> $env:USERNAME@$env:COMPUTERNAME`: $pwd `a")
#}
#Invoke-Expression (&starship init powershell)

# be able to launch broot.exe as br
# ME: commented out, since I will use broot for now?
#. C:\Users\Otter\AppData\Roaming\dystroy\broot\config\launcher\powershell\br.ps1
