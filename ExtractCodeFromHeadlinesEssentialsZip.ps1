Clear-Host

docker ps

Install-Module -Name navconteinerhelper -Force

Enter-NavContainer navserver

cd C:\
dir
cd C:\extensions
dir
Exit

docker cp navserver:C:\extensions\EssentialBusinessHeadlines.Source.zip C:\ProgramData\navcontainerhelper\Extensions\navserver\my
Invoke-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my

Copy-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my\EssentialBusinessHeadlines.Source.zip -Destination C:\Users\vmadmin\Documents\AL

Invoke-Item C:\Users\vmadmin\Documents\AL

#Extract zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory('C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.Source.zip', 'C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.Source')
Invoke-Item C:\Users\vmadmin\Documents\AL

#Open VSCode
Remove-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my\EssentialBusinessHeadlines.Source.zip
Remove-Item C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.Source.zip -Force
Remove-Item C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.Source -Force


