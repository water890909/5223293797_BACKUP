#//BREAKING POINT (i made this game to learn powershell more, its not good but its playable)
# https://github.com/water890909-design/RussianR.git


#//// ASCII FRAMES
#Standing 
function Show-Stand { #Verb-Noun because thats what bill gates microsoft would have wanted
    return @"
 0
/|\
/ \
"@
}

#GunHolding Left
function Show-GunLeft {
    return @"
 0__<
/|
/ \
"@
}

#GunHoldingSelf Left
function Show-GunSelfLeft {
    return @"
 0__>
/|
/ \
"@
}

#GunHolding Right
function Show-GunRight {
    return @"
<__0
   |\
  / \
"@
}

#GunHoldingSelf Right
function Show-GunSelfRight {
    return @"
<__0
   |\
  / \
"@
}

#ShotDead Right
function Show-ShotRight {
    return @"

  \  
X--- \
 /  \
"@
}

#ShotDead Left
function Show-ShotLeft {
    return @"

    /
/ ---X
 /  \
"@
}

#Table
function Show-Table {
    return @"
_____
|   |
"@
}
#////


# how to make it work i think:
# <Stickman> <table> <Stickman>, like the syntax for arithmetic operators


#MAIN MENU
function Show-MainMenu {
    while ($true) {

    Clear-Host
    Write-Host "<--------------------->" -ForegroundColor DarkGray
    Write-Host "     BreakingPoint     " -ForegroundColor Red
    Write-Host "        V1.0.0         " -ForegroundColor DarkGray
    Write-Host "<--------------------->" -ForegroundColor DarkGray
    Write-Host"" #space
    Write-Host "|      1: Start       |" -ForegroundColor Green
    Write-Host "|      2: Stats       |" -ForegroundColor Green
    Write-Host "|      3: Mods        |" -ForegroundColor Green
    Write-Host "|      4: Credits     |" -ForegroundColor Green
    Write-Host"" #space

    $choice = Read-Host "Select an option 1-4"
    switch($choice) {
        "1" {Start-Game}
        "2" {Show-StatsFrame}
        "3" {Show-ModsFrame}
        "4" {Show-CreditsFrame}
    }
 }
}



function Show-StatsFrame {
    Clear-Host
    Write-Host "<--------------------->" -ForegroundColor DarkGray
    Write-Host "         Stats         " -ForegroundColor DarkGreen
    Write-Host "<--------------------->" -ForegroundColor DarkGray   
    Write-Host ""
    Write-Host "nothing here yet" -ForegroundColor Red
    Write-Host ""
    Read-Host '"Enter" to go back to main menu'
    Show-MainMenu
}



function Show-ModsFrame {
    Clear-Host
    Write-Host "<--------------------->" -ForegroundColor DarkGray
    Write-Host "          Mods         " -ForegroundColor DarkGreen
    Write-Host "<--------------------->" -ForegroundColor DarkGray   
    Write-Host ""
    Write-Host "on diddy im gonna make a carti mod" -ForegroundColor Red
    Write-Host ""
    Read-Host '"Enter" to go back to main menu'
    Show-MainMenu
}



function Show-CreditsFrame {
    Clear-Host
    Write-Host "<--------------------->" -ForegroundColor DarkGray
    Write-Host "        Credits        " -ForegroundColor DarkBlue
    Write-Host "<--------------------->" -ForegroundColor DarkGray   
    Write-Host""
    Write-Host "|ascii art and scripting by Water890909" -ForegroundColor Blue
    Write-Host "|inspired by ThyCitrus' PowerShell Text Adventure" -ForegroundColor Yellow
    Write-Host "|stole the game idea from Breaking Point (Roblox)"-ForegroundColor Yellow
    Write-Host ""
    Write-Host "|AUDIO:" -ForegroundColor Magenta
    Write-Host "|relief breath - https://pixabay.com/sound-effects/male-breathing-slow-14558" -ForegroundColor Magenta
    Write-Host "|empty chamber - https://pixabay.com/sound-effects/piston-cap-plastic-gun-364851" -ForegroundColor Magenta

    Write-Host ""
    Write-Host ""
    Read-Host '"Enter" to go back to main menu'
    Show-MainMenu
}


#Game loop
function Start-Game {
    $gameRunning = $false
    $playerTurn = $false

    $playerObjects = @(
        @($Name = "Player"; $Alive = $true),
        @($Name = "Bot1"; $Alive = $true),
        @($Name = "Bot2"; $Alive = $true),
        @($Name = "Bot3"; $Alive = $true)
    )
    $alivePlayers = $playerObjects | Where-Object {$_.$Alive}



    Write-Host "loading..." 
    Start-Sleep -Milliseconds 2500


}

Show-MainMenu