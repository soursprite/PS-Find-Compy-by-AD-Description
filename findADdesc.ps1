#allows AD computer obj search by description and prints list of computers and descriptions to console
#by James

Import-Module ActiveDirectory

Write-Host "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Write-Host "The output is limited to the width of the window, so maximize the window before performing the search."
Write-Host "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
Write-Host ""

$a = Read-Host -Prompt 'ACES Computer Description Search'
$desc = "*"+$a+"*"

Get-ADComputer -Filter 'Description -like $desc' -SearchBase "OU=ACES,OU=URBANA,DC=ad,DC=uillinois,DC=edu" -Property Name, Description, CanonicalName | FT Name,Description, CanonicalName #| Export-CSV "tempy.csv" -NoTypeInformation -Encoding UTF8


Read-Host -Prompt "Press Enter to exit"