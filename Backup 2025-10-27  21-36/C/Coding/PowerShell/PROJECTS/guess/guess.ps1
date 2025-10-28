#INFO: make path setups in script, and new text file (REPLACE PATH FOR DataContent in updateTemptData and showWins function)

#SETUP
$script:cheats = $null
$script:dataPath = Join-Path $PSScriptRoot "data.txt"
$script:attempts = 0
$script:randomNumber = $null
function randomizeNumber {
    $script:randomNumber = Get-Random -Minimum 1 -Maximum 10
}

#i stole this from quist but i modified it its mine now
#individually types out each letter for write-host
Clear-Host
function Type-Host($text) {
    foreach ($character in $text.ToCharArray()) { #ToCharArray puts each character in ordered array
        Write-Host $character -NoNewline #character is automatically assigned indexes by foreach
        Start-Sleep -Milliseconds 50
    }
    Write-Host"" #make new line between Type-Host and next print
}

#DATA MANAGEMENT
function updateTempData{
    $DataContent = Get-Content -Path $script:dataPath -Raw
    $script:IntegerData = [int]$DataContent
    $script:TempData = ($script:IntegerData + 1) | Out-File -FilePath $script:dataPath #CHANGE THIS PATH
}




#CORRECT AND INCORRECT handling
function showWins {

    $DataContent = Get-Content -Path $script:dataPath -Raw
    $IntegerData = [int]$DataContent

    Clear-Host
    Write-Host "Total wins: $IntegerData" -ForegroundColor DarkGray
    if ($IntegerData -eq 0) { Write-Host "you have no wins. you either just started or you are insanely bad at guessing" -ForegroundColor DarkGray}
    Write-Host ""
    Read-Host "Enter to continue"
    Clear-Host
}

#if correct answer is chosen, add one attempt to score (so its seperated from win screen loop)
function addOneForCorrect {
    $script:attempts = $script:attempts + 1
} 
    
#if right number is picked, add 1 to data save, print attempts, read host for next choice (exit or retry)
function correctNumber {
    Clear-Host
    Write-Host "The correct number was $script:randomNumber" -ForegroundColor DarkGray

    if ($script:attempts -le 0) {
        Write-Host "huh" -ForegroundColor Green
    }
    if ($script:attempts -eq 1) {
        Write-Host "you picked the correct number in only 1 attempt!! you are a genius" -ForegroundColor Green
        updateTempData
    }
    else { Write-Host "you picked the correct number in $attempts attempts YOU ARE DUMB, DO BETTER" -ForegroundColor Red }

    Write-Host""

    $choice = Read-Host "try again (1) or quit (2)"
    switch($choice) {
        "1" {$script:attempts = 0;
            Clear-Host pickNumber}
        "2" { exit }
        default {correctNumber }
    }
    randomizeNumber 
}

#choosing incorrect number adds 1 to attempt and prints message
function incorrectNumber {
    $script:attempts = $script:attempts + 1
    $contexts = @(
        "Invalid choice, stupid",
        "Wrong number",
        "that was a dumb choice",
        "WRONG, WRONG, WROOOOOOOONG",
        "No"
    )

    $context = Get-Random -InputObject $contexts
    Write-Host $context -ForegroundColor Red
    Start-Sleep 0.6
    Clear-Host
}


#if answer is not an integer then this
function notAnInteger {
    Clear-Host
    Write-Host "Your answer is not an integer you stupid monkey, should honestly end the game right here your so dumb"
    Start-Sleep 1
    Clear-Host
}







#///MAIN
function pickNumber {
    Clear-Host
    randomizeNumber
    $script:randomNumber = $script:randomNumber
    while ($true) {

    #///CHEATS
    if ($script:cheats) {
        Clear-Host
        Write-Host $script:randomNumber
    }
    else
    {Clear-Host}

    $choice = Read-Host "pick a number 1 - 10"
 switch($choice) {
    #option to show wins
    "wins" { showWins }

    #option to turn cheats on
    "cheatsOn" {
        $script:cheats = $true
    }
    
    #option to turn cheats on
    "cheatsOff" {
        $script:cheats = $false
    }

    #if correct number is chosen, do this
    $randomNumber { addOneForCorrect
    Clear-Host
    correctNumber 
    }

    #for default option use incorrectNumber logic
    default { incorrectNumber } 
}
      }
}

#loading screen, has a lot of lines cus of a stupid dialogue feature
function intro {
    Clear-Host 
    Write-Host "1 attempt = YOU WIN, YOU ARE A GENIUS" -ForegroundColor Green
    Write-Host ""
    Write-Host "2+ attempts = YOU DONT WIN YOU ARE DUMB" -ForegroundColor Red
    Write-Host ""
    Write-Host "also you can type (wins) to see your total wins" -ForegroundColor DarkGray 
    Write-Host ""

    $introInput = Read-Host "Enter to continue" 
    switch($introInput) {
        "wins" { Write-Host ""
        Write-Host "You cant see wins yet, click enter" -ForegroundColor Yellow
    $dia1 = Read-Host "Enter to continue"
switch($dia1) {
        "wins" {Write-Host ""
        Write-Host "are you stupid. click enter, then you can type wins" -ForegroundColor Yellow
    $dia2 = Read-Host "Enter to continue"

    switch($dia2) {
        "wins" {Write-Host ""
        Write-Host "YOU MUST BE DUMB, CLICK ENTER" -ForegroundColor Yellow
    $dia3 = Read-Host "Enter to continue"

    switch($dia3) {
        "wins" {Write-Host ""
        Write-Host "DO YOU NOT UNDERSTAND, JUST CLICK ENTER, ITS ON THE RIGHT SIDE OF YOUR KEYBOARD" -ForegroundColor Yellow
    $dia4 = Read-Host "Enter to continue"

    switch($dia4) {
        "wins" {Write-Host ""
        Write-Host "YOU. CANNOT. SEE. WINS. CLICK. ENTER." -ForegroundColor Yellow
    $dia5 = Read-Host "Enter to continue"

    switch($dia5) {
        "wins" {Write-Host ""
        Write-Host "https://en.wikipedia.org/wiki/Enter_key" -ForegroundColor Yellow
    $dia6 = Read-Host "Enter to continue"
    switch($dia6) {
        "wins" {Write-Host ""
        Write-Host "you are just being ignorant now. You know how to click enter, you just want to make me mad" -ForegroundColor Yellow
    $dia7 = Read-Host "Enter to continue"
    switch($dia7) {
        "wins" {Write-Host ""
        Write-Host "thats fine. im going to give you time to think about it" -ForegroundColor Yellow 
        Start-Sleep 5
        Write-Host ""
        Write-Host "alright. its right there. right side of your keyboard. you click enter, it takes you to the game, and you can see wins. very simple" -ForegroundColor Yellow
    $dia8 = Read-Host "Enter to continue"
    switch($dia8) {
        "wins" {Clear-Host
        Write-Host "this is a computer"
        Start-Sleep 2
        Write-Host "there is no feeling"
        Start-Sleep 2
        Write-Host "only 1's and 0's"
        Start-Sleep 2
        Write-Host "it just computes"
        Start-Sleep 2
        Write-Host "you have been reading this text for nothing"
        Start-Sleep 3
        Write-Host "under the impression that you were somehow angering a computer. were you having fun wasting all that time"
        Start-Sleep 4
        Write-Host "you could have been playing the game,"
        Start-Sleep 2
        Write-Host "or been doing something productive,"
        Start-Sleep 2
        Write-Host "but you have been typing wins for the past 40 seconds of your life."
        Start-Sleep 3
        Write-Host "at the end of the day, i won."
        Start-Sleep 2
        Write-Host "i wasted your time."
        Start-Sleep 2
        Write-Host "and you fell under the stupid impression that i was talking to you, while you typed the same thing over and over again"
        Start-Sleep 4
        Write-Host "type wins again. i encourage you. "
    Read-Host "Enter to continue"
    $name = whoami 
    $note = New-TemporaryFile
    Set-Content -Path $note -Value "i won. -sincerely, $name"
    Invoke-Item -Path $note
    exit
}
        default {
        }
    }}
        default {
        }
    }}
        default {
        }
    }}

        default {
        }
    }}
        default {
        }
    }}
        default {
        }
    }}
        default {
        }
    }}
        default {
        }
    }}
        default {
        }
    }
    Clear-Host
} 

#initialize loading and then main loop after
intro
pickNumber