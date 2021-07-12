#Requires -RunAsAdministrator
#
#Start-Process PowerShell -ArgumentList "Set-ExecutionPolicy Restricted -Force" -Verb RunAs
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
$cygwin = $null  #if $true, install cygwin/cyg-get

    # make sure to change choco install path for certain packages 
    #TODO: add the same for pstools , usually c:\tools\, but this needs to be changed
Write-Host "windows user's personal setup"
# Write-click on this script and run as Powershell script


# Must cd into install/dotfiles/bin folder (haven't decided where to put this)

#===========================================================================
# Enable Developer Mode (may require reboot?)
# [powershell - Enable Windows 10 Developer Mode programmatically - Stack Overflow](https://stackoverflow.com/questions/40033608/enable-windows-10-developer-mode-programmatically?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa)
#===========================================================================
	# Create AppModelUnlock if it doesn't exist, required for enabling Developer Mode
	$RegistryKeyPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock"
	if (-not(Test-Path -Path $RegistryKeyPath)) {
	    New-Item -Path $RegistryKeyPath -ItemType Directory -Force
	}
	
	# Add registry value to enable Developer Mode
	New-ItemProperty -Path $RegistryKeyPath -Name AllowDevelopmentWithoutDevLicense -PropertyType DWORD -Value 1

#===========================================================================
# TODO: # install WSL2 if possible
#===========================================================================

#===========================================================================
# Set XDG Directory EnvVar
#===========================================================================
[Environment]::SetEnvironmentVariable("XDG_CONFIG_HOME", "%USERPROFILE%\.config", "User")

#===========================================================================
# Chocolatey
#===========================================================================
#TODO: launch 3_choco.ps1

#===========================================================================
# Enable Remote Desktop (RDP)
# http://windowsitpro.com/windows/enable-remote-desktop-using-powershell
# TODO: test if it works on W10 HOME, since it doesn't have RDP server
#===========================================================================
(Get-WmiObject Win32_TerminalServiceSetting -Namespace root\cimv2\TerminalServices).SetAllowTsConnections(1,1) | Out-Null
(Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\cimv2\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null
# open firewall for RDP
Get-NetFirewallRule -DisplayName "Remote Desktop*" | Set-NetFirewallRule -enabled true

#===========================================================================
# NETWORK setup
#===========================================================================
# Enable PING
Get-NetFirewallRule -DisplayName "*File and Printer Sharing (Echo Request - ICMPv4-In)*" | Set-N etFirewallRule -enabled true

# Enable File and Printer Sharing - also be able to see \\COMPUTER
# TODO/FUTURE: array of folders on top, and create dir and share here
netsh advfirewall firewall set rule group="File and Printer Sharing" new enable=Yes

# optional: add sharing SMB
    # mkdir "C:\Shared"   #same as New-Item -path "C:\Shared"
    # New-SMBShare –Name “My_Shared” –Path “C:\Shared” –FullAccess Administrator -Confirm:$false

#===========================================================================
# Explorer: show Hidden files and show all extensions
#===========================================================================
# same as : Set Explorer Windows option 
    # Choose "Show hidden files, folders, and drives"
    # Uncheck "Hide extensions for known file types"
    # Uncheck "Hide protected operating system files (Recommended)"
$key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
if ((Get-ItemProperty $key).HideFileExt -ne 0) {
    # Do this only if necessary!  Get-ItemProperty first
    Write-Host "Setting Explorer to show hidden files and extensions"
    Set-ItemProperty $key Hidden 1
    Set-ItemProperty $key HideFileExt 0
    Set-ItemProperty $key ShowSuperHidden 1
    Stop-Process -processname explorer
}

#===========================================================================
# Swap Ctrl with CapsLock and/or assign Left ALT to Right CTRL
#===========================================================================
# see ~/bin/winkb*.reg
# Note: The user must re-login? /reboot to take effect
# setting binValues in registry: https://stackoverflow.com/a/33586470
#Change these three to match up to the extracted registry data and run as Admin
# currently, I'm only using LALT-RCTRL swap
#   CAPSLOCK is handled by Autohotkey due to ESC-CTRL mechanism
#
#   This part didn't run for some reason when I ran it on new machine... 
#   TEST it again when 
 
$key = 'HKLM:\SYSTEM\CurrentControlSet\Control\Keyboard Layout'
$attribute = "Scancode Map"
$propValue = (Get-ItemProperty $key).$attribute 
if (!$propValue) {  #if reg value doesn't exist

    Write-Host "Keyboard setting - swapping Ctrl with Alt "
    if ($keyboardRemapCapslock) {
        # Ctrl-Capslock and LeftALT with RCTRL
        $binValues = "00,00,00,00,00,00,00,00,03,00,00,00,1d,00,3a,00,1d,e0,38,00,00,00,00,00"
    }
    else {
        # Only LeftALT with RCTRL
        #"Scancode Map"=hex:00,00,00,00,00,00,00,00,02,00,00,00,1d,e0,38,00,00,00,00,00
        $binValues = "00,00,00,00,00,00,00,00,02,00,00,00,1d,e0,38,00,00,00,00,00"
    }
    $hexified = $binValues.Split(',') | % { "0x$_"}
    New-ItemProperty -Path $key -Name $attribute -PropertyType Binary -Value ([byte[]]$hexified)
}

# TODO: git clone my dotfiles and cd into that folder 
# then do the following


#===========================================================================
# emacs (choco) : set $HOME (for domain user only), as it has problem finding it
# TODO: move this to choco.ps1
#===========================================================================
if ($emacs) {

    choco install emacs -y  
    $key = 'HKCU:\SOFTWARE\GNU\Emacs'
    $attribute = "Home"
    $propValue = (Get-ItemProperty $key).$attribute 
    if (!$propValue) {  #if reg value doesn't exist
    
        Write-Host "Setting HOME value in Gnu Emacs"
        New-Item -Path $key -Force | Out-Null
        New-ItemProperty -Path $key -Name $attribute -PropertyType String -Value $HOME   -Force | Out-Null
    }
}

#===========================================================================
# OBS: TODO
#===========================================================================
# obs-studio
# 	obs-virtualcam // check ver???
# 	obs-ndi // check ver??


#===========================================================================
# Computer Name
# * must be last item, since it will restart
# optional
# FUTURE: add Domain cred here
#===========================================================================
if ($ComputerName) {
    Rename-Computer -NewName $ComputerName -Restart
}
