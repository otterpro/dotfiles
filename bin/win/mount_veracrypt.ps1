# This needs to be inside a bitlocker volume 
# enter password in the parameter
$password = '**************'

$volumes = @{'w:\'='\\?\Volume{000f7362-0000-0000-0000-100000000000}\';
    'n:\'='O:\HE0'}
foreach ($i in $volumes.GetEnumerator()) {
    $driveLetter = $i.Key;
    $volume = $i.Value;
    write-host "checking $driveLetter <= $volume";
    $needToBeMounted = $false
        if (!(test-path $driveLetter) ) {
            if ( $volume.startsWith('\\')) {
                if (gwmi Win32_Volume | ? { $_.deviceID -eq $volume} | select -expand name)  {
                    $needToBeMounted=$true
                }
            }
            elseif (Test-Path $volume) {
                $needToBeMounted=$true
            }
            if ($needToBeMounted) {
                write-host "mounting $driveLetter ($volume)";
                &"c:\Program Files\VeraCrypt\VeraCrypt.exe" /q /l $driveLetter  /p $password /v $volume
            }
        }
}
