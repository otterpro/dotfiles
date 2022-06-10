#Requires -RunAsAdministrator

# install choco and cygwin if indicated
#
## Start-Process PowerShell -ArgumentList "Set-ExecutionPolicy Restricted -Force" -Verb RunAs
# 
cd $PSScriptRoot


#===========================================================================
# CONFIG: change if needed
#===========================================================================
# change this if you want to rename the PC. 
# possible TODO: also set domain credential, etc
$ComputerName = $null
$keyboardRemapCapslock = $false
$MyChocolateyToolsPath="C:\bin\choco"
$emacs = $null  #if $true, install emacs and do settings
$installChoco = $false #$true  #if true, install choco and its packages
$cygwin = $null  #if $true, install cygwin/cyg-get

    # make sure to change choco install path for certain packages 
    #TODO: add the same for pstools , usually c:\tools\, but this needs to be changed
# Write-click on this script and run as Powershell script

# ensure ExecutionPolicy to either AllSigned or Bypass
# TODO: THIS should be in DOS SCRIPT
#Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Force

# if above line doesn't work, try this
# (https://superuser.com/questions/616106/set-executionpolicy-using-batch-file-powershell-script)
# Start-Process PowerShell -ArgumentList "Set-ExecutionPolicy unrestricted -Force" -Verb RunAs

# MYVIMRC="C:\cygwin64\home\Dkim"
# [Environment]::SetEnvironmentVariable("MYVIMRC", "C:\Cygwin64\home\$env:username", "User")

# Must cd into install/dotfiles/bin folder (haven't decided where to put this)


if (!$chocoInstall) {  
    Write-Host "Choco/cygwin is not set to be installed"
    exit 0
}

#===========================================================================
# Chocolatey
#===========================================================================
if (!($env:ChocolateyInstall)) {  #if choco is not installed
    Write-Host "Choco has not been installed yet.  Installing Chocolatey..."

    # install and update choco
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}


    #[Environment]::SetEnvironmentVariable($env:ChocolateyToolsLocation, "c:\bin\choco", [EnvironmentVariableTarget]::Machine)
    # Turns out I need to use User, not Machine
    # permanently
    [Environment]::SetEnvironmentVariable("ChocolateyToolsLocation", $MyChocolateyToolsPath, "User")
    # also for this session
    $env:ChocolateyToolsLocation= $MyChocolateyToolsPath   
    
    #NOTE: also might change it to c:\ProgramData\chocolatey\bin, as this is where some bin files are going to.

    # choco update
    choco upgrade chocolatey -y
    # Base
    choco install git git-credential-winstore poshgit -y
    choco install oh-my-posh cmake -y
    # choco install python -y  
    # choco install python2 -y
    # python2 required for gvim?

    # tools essential
    choco install -y delta everything ripgrep powertoys 7zip autohotkey python fzf zoxide fd llvm
    #choco install ag -y

    # file manager
    choco install qdir -y
	# choco install altap-salamander # salamander
	# choco xyplorerfree # broken??? haven't tried
    
    # RUST
    choco install -y rust-ms
    # rust: may instead use rustup-init.exe from rust, which is better?
    # add path to cargo bin
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$($env:userprofile)\.cargo\bin\", "User")

    # utils
    choco install bginfo -y

    # file size
    choco install wiztree -y
    choco install spacesniffer -y
    choco install treesizefree -y

    # copyq is ok, could try another such as clipboardic or clcl
    choco install copyq -y
    choco install greenshot -y
    choco install flameshot -y
    # broken?
    # choco install teracopy -y

    # Network tool
    choco install zerotier-one -y
    
    # editors
	choco install -y vim vscode notepadplusplus neovim

    # Media
    choco install -y ffmpeg vlc foobar2000 musicbee mpc-be exiftool
    
    # possibly broken/ fails / not latest, but would like
    # choco install synergy -y

    # FONTS
    # Korean font
    # choco install nanumfont -y  # don't install. install fantasq istaed
        # problem: requires user to interact on GUI on setup!!!
        
    # fixed-width fonts
    # TODO: iosveka, not available yet
    choco install -y sourcecodepro fantasque-sans.font nanum-gothic-coding-font
    
    # browsers
    # choco install GoogleChrome Firefox -y
    #optional: vivaldi
    
    # add to path: C:\ProgramData\chocolatey\bin\  (ffmpeg)
    #TODO: ? is this required? or is this set with chocolatey install?
    # [Environment]::SetEnvironmentVariable("Path", $env:Path + ";"+$env:ProgramData+"\chocolatey\bin", [EnvironmentVariableTarget]::Machine)
    # not sure, so commented out for now.  If 'ffmpeg' won't launch, check

#===========================================================================
# install cygwin and then git clone my repository first!!!
#===========================================================================
# DO I use cygwin? or git-windows-bash? cygwin is too heavy?!
# install git-win-bash, using DOS script, use it to bootstrap and 
# Currently using cygwin as git, since cygwin is more versatile
if ($cygwin) {
#choco install cygwin -y  # automatically installed by cyg-get?
    choco install cyg-get -y
    cyg-get git zip unzip vim zsh python curl tree

    # CONTINUE HERE!!!
    $cygwinBin="$env:ChocolateyToolsLocation\cygwin\bin"
    $cygwinHomeDir="$env:ChocolateyToolsLocation\cygwin\home\$env:username"

# cygwin has to run at least once, as it creates username and home directory
# not sure if this will work... hopefully it's not interactive???  icon has mintty.exe -i (-i = ???)
    &"$cygwinBin\mintty.exe"
}

