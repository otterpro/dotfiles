#Requires -RunAsAdministrator

#===========================================================================
# Swap Ctrl with CapsLock
# relogin after running
# see https://superuser.com/a/997448/790554
#===========================================================================
 
$hexified = "00,00,00,00,00,00,00,00,02,00,00,00,1d,00,3a,00,00,00,00,00".Split(',') | % { "0x$_"};
$kbLayout = 'HKLM:\System\CurrentControlSet\Control\Keyboard Layout';

New-ItemProperty -Path $kbLayout -Name "Scancode Map" -PropertyType Binary -Value ([byte[]]$hexified);

