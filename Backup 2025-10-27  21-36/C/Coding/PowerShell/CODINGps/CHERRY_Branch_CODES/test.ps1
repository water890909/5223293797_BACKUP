$code = 1818
$input = Read-Host "Please enter the code"
switch ($input) {
    $code {Write-Host "Access Granted"}
    default {Write-Host "Wrong Code"
Start-Sleep 1
Clear-Host
}
}
