#Requires -RunAsAdministrator
# admin mode required for making symlink

# map the L:\ to WSL drive
# disabled: this only works in non-admin, as it fails in admin mode
# this might be fixed in future version
# net use L: "\\wsl$\Debian\"

# TODO: create scheduled task to git push_notes.sh
### $cygwinBin="$env:ChocolateyToolsLocation\cygwin\bin"
## admin mode doesn't work with mapped drive in wsl(ie L:)
# $wslHomeDir="L:\home\$env:username".ToLower()
## instead, using UNC
$wslHomeDir="\\wsl$\Debian\home\$env:username".ToLower()

#===========================================================================
# clone / install dotfiles 
# 1. run ~/bin/setup/clone_dotfiles.sh (which does "git clone")
#   * create SSH key  (so I can SSH and also use GIT)
#   * git clone .dotfiles notes etc
# 2. run ~/.dotfiles/dotfiles.sh
# 3. create symlink ~/.ssh/ => home\.ssh\ (so it can share ssh keys with other apps)
#===========================================================================
# & $cygwinBin\bash.exe $cygwinHomeDir\bin\setup\clone_dotfiles.sh
# & $cygwinBin\bash.exe $cygwinHomeDir\.dotfiles\install_dotfiles.sh


#OLD & $cygwinBin\bash.exe $cygwinHomeDir\bin\setup\make_sshkey.sh
#New-Item -Path  "$env:USERPROFILE\.ssh\"  -ItemType SymbolicLink -Value "$cygwinHomeDir\.ssh\"

#OLD create symlink: cygwin's home .ssh/ ==> Windows home .ssh/
#OLD OLD
#OLD $DotfileTargetPath="$env:ChocolateyToolsLocation\cygwin\home\$env:username\.dotfiles"
#OLD $DotfileTargetPath="/home/otter/.dotfiles"
#OLD
#OLD &"$cygwinBin\git.exe" clone https://github.com/otterpro/dotfiles.git $DotfileTargetPath
#OLD &"$cygwinBin\bash.exe" "$DotfileTargetPath\dotfiles.sh"

#===========================================================================
# symlink .vim, .vimrc, .gvim
# symlink cygwin's ~/ to Win's ~/cyghome/
# prerequisite: cygwin and .dotfiles/ (and maybe win VIM)
#===========================================================================

Write-Host "creating symbolic link for vim"
#cmd /c mklink "$env:USERPROFILE\.vimrc" -ItemType SymbolicLink -Value "$wslHomeDir\.dotfiles\.vimrc"
New-Item -Path  "$env:USERPROFILE\.vimrc" -ItemType SymbolicLink -Value "$wslHomeDir\.dotfiles\.vimrc" -Force
if (!(Test-Path -Path "$env:USERPROFILE\vimfiles_old\")) { 
    Move-Item -Path "$env:USERPROFILE\vimfiles\" "$env:USERPROFILE\vimfiles_old\"
    # Remove-Item -Path "$env:USERPROFILE\vimfiles\" -Recurse -Force
    # also delete existing vimfiles\ since I can't create new symlink on existin dir
    # but instead of deleting, move it to temp folder for safety!!!
}
New-Item -Path  "$env:USERPROFILE\vimfiles\"  -ItemType SymbolicLink -Value "$wslHomeDir\.dotfiles\.vim\" -Force
    # Windows Vim uses vimfiles/, not .vim/
New-Item -Path  "$env:USERPROFILE\.gvimrc"  -ItemType SymbolicLink -Value "$wslHomeDir\.dotfiles\.gvimrc" -Force

# NOT YET: create symlink to wsl/home/USERNAME, (TODO: not sure if I want to do this)
# WIN:~/wslHome -> //wsl$/debian/home/USER/
#New-Item -Path  "$env:USERPROFILE\wslHome\"  -ItemType SymbolicLink -Value "$wslHomeDir\"

#===========================================================================
# create symbolic link for PS profile (includes aliases, etc)
#  ~/bin/profile.ps1 ==> C:\Users\<USERNAME>\Documents\WindowsPowershell\profile.ps1
#  * Warning: Make sure not to delete existing profile.ps1, 
#  * esp if working on other's PC (or based on company's policy)
#=========================================================================== 
if (!(Test-Path -Path $profile.CurrentUserAllHosts)) { 
    Write-Host "PS Profile: creating symink for PS profile"
    New-Item -path $profile.CurrentUserAllHosts -ItemType SymbolicLink -Value "$wslHomeDir\.dotfiles\_win\profile.ps1" -Force
}

#===========================================================================
# 1. symlink ~/bin 
# 2. add ~/bin/win/ to %PATH%
#===========================================================================
New-Item -Path  "$env:USERPROFILE\bin\" -ItemType SymbolicLink -Value "$wslHomeDir\.dotfiles\bin\" -Force
# Add `$home/tool/` to user's `$PATH` (Local, recommended, no need to be admin)
$UserPath = [Environment]::GetEnvironmentVariable("Path","User") 
[Environment]::SetEnvironmentVariable("Path", $UserPath + ";$($env:userprofile)\bin\win", "User")
