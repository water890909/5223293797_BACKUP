#i stole this from quist but i modified it its mine now
#individually types out each letter for write-host
Clear-Host
function Type-Host($text, $value = 50, $color = "White", $newLine = $true) {
    foreach ($character in $text.ToCharArray()) { #ToCharArray puts each character in ordered array
        Write-Host $character -NoNewline -ForegroundColor $color #character is automatically assigned indexes by foreach
        Start-Sleep -Milliseconds $value
    }
    if ($newLine) {Write-Host""}
}



#EXAMPLE
function Example {
    Type-Host "one time, " 150 White $false #Format: Type-Host / [string]"text" / [string]"color" / [int]milliseconds / [bool]$newLine
    Type-Host "i caught a fish" 50 White
    Start-Sleep -Milliseconds 500

    Type-Host "it was " 25 White $false
    Start-Sleep -Milliseconds 500 
    Type-Host "massive" 200 Blue
    Start-Sleep -Milliseconds 1000

    Type-Host "then it " 50 White $false
    Type-Host "mugged me" 200 Red $false
    Start-Sleep -Milliseconds 3000
    Type-Host ", and it ran away" 15 White
    Write-Host ""
}
Example