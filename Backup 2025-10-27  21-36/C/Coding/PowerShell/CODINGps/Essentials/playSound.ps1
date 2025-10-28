function playAudio{
    param (
        [string]$audioFilePath
    )

    #SETUP
    $shell = New-Object -ComObject Shell.Application #shell.app can access files, folders, and their metadata
    $folder = Split-Path $audioFilePath #gets directory of file because the shell COM object doesnt work with files or sum like that
    $file = Split-Path $audioFilePath -Leaf #get audio file

    $shellFolder = $shell.Namespace($folder) #makes folder into an object 
    $shellFile = $shellFolder.ParseName($file) #makes file into an object i think idk 
    $fileLength = $shellFolder.GetDetailsOf($shellfile, 27) #27 is index for length property

    $duration = [timespan]::Parse($fileLength) #converts $fileLength text to time span object
    $time = [math]::Ceiling($duration.TotalSeconds) #read $duration as number and round to nearest whole number for start-sleep


    #PLAYING AUDIO
    Add-Type -AssemblyName PresentationCore #loads presentation core which has media player
    $mediaPlayer = New-Object System.Windows.Media.MediaPlayer #create media player object 
    $mediaPlayer.Open($audioFilePath)
    $mediaPlayer.Play()

    Start-Sleep -Seconds $time
    $mediaPlayer.Stop()
    $mediaPlayer.Close()
}

playAudio "C:\Users\5223293797\Downloads\ultraKill.mp3"