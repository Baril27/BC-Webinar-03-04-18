Clear-Host

docker ps

Install-Module -Name navconteinerhelper -Force

#1. Exploring NavContainer files
Enter-NavContainer navserver

cd C:\
dir
cd C:\extensions
dir
Exit

#2. Copy file with Extension source code from Container to host
docker cp navserver:C:\extensions\EssentialBusinessHeadlines.Source.zip C:\ProgramData\navcontainerhelper\Extensions\navserver\my
Invoke-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my

Copy-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my\EssentialBusinessHeadlines.Source.zip -Destination C:\Users\vmadmin\Documents\AL

Invoke-Item C:\Users\vmadmin\Documents\AL

#3. Extract zip
Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::ExtractToDirectory('C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.Source.zip', 'C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.Source')
Invoke-Item C:\Users\vmadmin\Documents\AL

#4. Open VSCode

#5. Show table with headlines results
Start 'https://air-d365bc-dev.westeurope.cloudapp.azure.com/nav/?tenant=default&signInRedirected=1&table=1438'

#6. Remove old files
Remove-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my\EssentialBusinessHeadlines.Source.zip
Remove-Item C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.Source.zip -Force
Remove-Item C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.Source -Force

