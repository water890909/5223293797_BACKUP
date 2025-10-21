#ULTRAKILL BUT YOUR BLIND
Clear-Host


#TYPE HOST EFFECT
function Type-Host($text, $value = 50, $color = "White", $newLine = $true) {
    foreach ($character in $text.ToCharArray()) { #ToCharArray puts each character in ordered array
        Write-Host $character -NoNewline -ForegroundColor $color #character is automatically assigned indexes by foreach
        Start-Sleep -Milliseconds $value
    }
    if ($newLine) {Write-Host""}
}


#INTRO SEQUENCE
function introSequence {
   Type-Host "[REDACTED]: Retrieved." 100 DarkGray $true
   Type-Host "STATUS: HELL IS FULL." 25 DarkGray $true
   Type-Host "Processing" 25 DarkGray $false
   Start-Sleep 0.3
   Type-Host "." 300 DarkGray $false
   Start-Sleep 0.3
   Type-Host "." 300 DarkGray $false
   Start-Sleep 0.3
   Type-Host "." 300 DarkGray $false

   Write-Host ""
   Type-Host '$V1Status = Get-Status | ./Machines/"V1"' 25 DarkGray $true
   Type-Host 'Write-Host $V1Status' 25 DarkGray $true
   Type-Host "Printing" 25 DarkGray $false
   Start-Sleep 0.3
   Type-Host "." 300 DarkGray $false
   Start-Sleep 0.3
   Type-Host "." 300 DarkGray $false
   Start-Sleep 0.3
   Type-Host "." 300 DarkGray $false
   Clear-Host

   Type-Host "V1_Status:" 25 DarkGray $true
   Type-Host "Weapons-" 25 DarkGray $false
   Type-Host "Working" 100 Green $true
   Type-Host "Movement-" 25 DarkGray $false
   Type-Host "Working" 100 Green $true
   Type-Host "Vision-" 25 DarkGray $false
   Start-Sleep 1
   Type-Host "[ERROR]" 100 RED $true
   Start-Sleep 1
   Clear-Host 
}

function introSequenceEnding {
    Type-Host "      ULTRAKILL   " 25 Red $true
    Type-Host "    but your blind" 50 White $true
    Write-Host ""
    Read-Host "       ENTER" 
}
introSequence
introSequenceEnding


#VARIABLES 
$HP = 100
$damage = 15
$filth_enemy = {
    $filthHP = 100
    $filthDamage = 15
}


function startGame {
    $i = 0
    while ($i -lt 60) {
        Write-Host $i
        Start-Sleep 1
        $i++
    }

}