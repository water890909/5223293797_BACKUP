Clear-Host
function Type-Host($text, $value) {
    foreach ($character in $text.ToCharArray()) { #ToCharArray puts each character in ordered array
        Write-Host $character -NoNewline #character is automatically assigned indexes by foreach
        Start-Sleep -Milliseconds $value
    }
    Write-Host"" #make new line between Type-Host and next print
}

function initWins{
    Type-Host "this is a computer" 
        Start-Sleep 2
        Type-Host "there is no feeling"
        Start-Sleep 2
        Type-Host "only 1's and 0's"
        Start-Sleep 2
        Type-Host "it just computes"
        Start-Sleep 2
        Type-Host "you have been reading this text for nothing"
        Start-Sleep 3
        Type-Host "under the impression that you were somehow angering a computer. were you having fun wasting all that time"
        Start-Sleep 4
        Type-Host "you could have been playing the game,"
        Start-Sleep 2
        Type-Host "or been doing something productive,"
        Start-Sleep 2
        Type-Host "but you have been typing wins for the past 40 seconds of your life."
        Start-Sleep 3
        Type-Host "at the end of the day, i won."
        Start-Sleep 2
        Type-Host "i wasted your time."
        Start-Sleep 2
        Type-Host "and you fell under the stupid impression that i was talking to you, while you typed the same thing over and over again"
        Start-Sleep 4
        Type-Host "type wins again. i encourage you. "
    Read-Host "Enter to continue"
    $name = whoami 
    $note = New-TemporaryFile
    Set-Content -Path $note -Value "i won. -sincerely, $name"
    Invoke-Item -Path $note
}


$wins = Read-Host "type wins"
if ($wins = "wins") {
    initWins
}
