#\Coding\PowerShell\CODINGps\psTesting.ps1











#Add-Content -Path "C:\Coding\PowerShell\CODINGps\guess\data.txt" -Value "hi"
#Invoke-Item "C:\Coding\PowerShell\CODINGps\guess\data.txt"


<#
$scriptPath = $MyInvocation.MyCommand.Path
Write-Output "Full script path: $scriptPath"
#>



#operators include 
<#
( )
++ --
! -not
* / %
+ -
-is -isnot -as
-eq -ne -gt -ge -lt -le
-contains -notContains
-and -or -xor
= += -= *= /= %=
#>


#SETUP
<#
Clear-Host
Set-Clipboard -Value "You pasted this"
$clip = Get-Clipboard
$user = whoami

#HANDLE INPUT
function takeInput1 {
    Clear-Host
    Write-Host "You pasted, great job, you must be smart"
    Start-Sleep 100
    Write-Host "Would be a shame if i knew your information, $user" -ForegroundColor DarkGray
    Start-Sleep 0.5
    Clear-Host
    Read-Host "Lets move on (Yes/No)"
    Write-Host "Great choice. Glad you want to move on. "
    Start-Sleep 5
}

$Paste = Read-Host "Right click and paste"
switch($Paste) {
    $clip { takeInput1 }
    default {Write-Host "You did it wrong"}
}
#>