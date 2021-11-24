#Requires -RunAsAdministrator
# admin mode required for making symlink
#
# Create symlink for .vim, .vimrc, PSProfile, and .dotfiles to Windows side

# TODO: create scheduled task to git push_notes.sh
### $cygwinBin="$env:ChocolateyToolsLocation\cygwin\bin"
$wslHomePath="\\wsl$\Debian\home\$env:username".ToLower()

# assuming that this script is in dotfiles/win/setup/
$targetPath = "$PSScriptRoot\..\.."
$xdg_config_home = "$env:USERPROFILE\.config"

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
#cmd /c mklink "$env:USERPROFILE\.vimrc" -ItemType SymbolicLink -Value "$targetPath\.dotfiles\.vimrc"
New-Item -Path  "$env:USERPROFILE\.vimrc" -ItemType SymbolicLink -Value "$targetPath\.vimrc" -Force
if (!(Test-Path -Path "$env:USERPROFILE\vimfiles_old\")) { 
    Move-Item -Path "$env:USERPROFILE\vimfiles\" "$env:USERPROFILE\vimfiles_old\"
    # Remove-Item -Path "$env:USERPROFILE\vimfiles\" -Recurse -Force
    # also delete existing vimfiles\ since I can't create new symlink on existin dir
    # but instead of deleting, move it to temp folder for safety!!!
}
New-Item -Path  "$env:USERPROFILE\vimfiles\"  -ItemType SymbolicLink -Value "$targetPath\.vim\" -Force
    # Windows Vim uses vimfiles/, not .vim/
New-Item -Path  "$env:USERPROFILE\.gvimrc"  -ItemType SymbolicLink -Value "$targetPath\.gvimrc" -Force

# neovim 
New-Item -Path  "$xdg_config_home\nvim\init.vim" -ItemType SymbolicLink -Value "$targetPath\.vimrc" -Force
New-Item -Path  "$xdg_config_home\nvim\vimfiles\"  -ItemType SymbolicLink -Value "$targetPath\.vim\" -Force
New-Item -Path  "$xdg_config_home\nvim\"  -ItemType SymbolicLink -Value "$targetPath\.gvimrc" -Force

#===========================================================================
# create symlink WIN:/users/USERNAME/.dotfiles -> wsl/home/USERNAME
# ie WIN:~/wsl-> //wsl$/debian/home/USER/
# for convenience, but not necessary, not sure if it will be used that much
#===========================================================================
New-Item -Path  "$env:USERPROFILE\wsl\"  -ItemType SymbolicLink -Value "$wslHomePath\"

#===========================================================================
# create symbolic link for PS profile (includes aliases, etc)
#  ~/.dotfiles/_win/profile.ps1 ==> C:\Users\<USERNAME>\Documents\WindowsPowershell\profile.ps1
#  * Warning: Make sure not to delete existing profile.ps1, 
#  * esp if working on other's PC (or based on company's policy)
#=========================================================================== 
#if (!(Test-Path -Path $profile.CurrentUserAllHosts)) { 
    Write-Host "PS Profile: creating symink for PS profile"
    New-Item -path $profile.CurrentUserAllHosts -ItemType SymbolicLink -Value "$targetPath\win\profile.ps1" -Force
#}

#===========================================================================
# 1. symlink ~/bin 
# 2. add ~/bin/win/ to %PATH%
#===========================================================================
New-Item -Path  "$env:USERPROFILE\bin\" -ItemType SymbolicLink -Value "$targetPath\win\bin\" -Force
# Add `$home/tool/` to user's `$PATH` (Local, recommended, no need to be admin)
$UserPath = [Environment]::GetEnvironmentVariable("Path","User") 
[Environment]::SetEnvironmentVariable("Path", $UserPath + ";$($env:userprofile)\bin", "User")
