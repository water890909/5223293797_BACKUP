#text file that has locations we are backng up 
$BackupLocationsFilePath = "C:\Coding\PowerShell\CODINGps\Essentials\Backup\backup.txt"
$BackupLocations = Get-Content -Path $BackupLocationsFilePath

#folder wheree we put backups
$StorageLocation = "C:\Users\5223293797\Desktop\Backups"
$BackupName = "Backup $(Get-Date -Format "yyyy-MM-dd  HH-mm")"

foreach($Location in $BackupLocations){ #every path in the txt file (?)
    Write-Output "Backing up $($Location)"
    $LeadingPath = "$($Location.Replace(':',''))" #this is to copy root directory, without it, the folder your backing up wont be copied (only contents)
    if (-not (Test-Path $StorageLocation\$BackupName\$LeadingPath)){ #checks if a folder with the backup name esists
        New-Item -Path "$StorageLocation\$BackupName\$LeadingPath" -ItemType Directory
    }
    Get-ChildItem -path $Location | Copy-Item -Destination "$StorageLocation/$BackupName\$LeadingPath" -Container -Recurse 
    #LINE ABOVE: Recurse copies the folders in in folder and all their stuff, Container preserves directory structure
}

#Compress-Archive -Path "$StorageLocation\$BackupName" -DestinationPath "$StorageLocation\$BackupName.zip" -CompressionLevel Fastest
#COMPRESSING DOESNT WORK FOR SOME REASON