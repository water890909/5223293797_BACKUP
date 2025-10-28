#HOW TO MAKE:
#1:generate random codes 
#2:put them into an array 
#3:then assign the id's with a code
#(PUT INTO RETRIEVE CODE SCRIPT)

$numbers = 0..100
for ($i = 0; $i -lt $numbers.Length; $i++) {
    $script:id = $numbers[$i]
    #Write-Host "id $id is assigned number $i"
}


Add-Type -AssemblyName System.Web
[System.Web.Security.Membership]::GeneratePassword(12, 3)