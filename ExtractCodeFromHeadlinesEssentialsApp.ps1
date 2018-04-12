Clear-Host

docker ps

Install-Module -Name navconteinerhelper -Force

Enter-NavContainer navserver

cd C:\
dir
cd C:\extensions
dir
Exit

docker cp navserver:C:\extensions\EssentialBusinessHeadlines.app C:\ProgramData\navcontainerhelper\Extensions\navserver\my
Invoke-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my

Copy-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my\EssentialBusinessHeadlines.app -Destination C:\Users\vmadmin\Documents\AL

Invoke-Item C:\Users\vmadmin\Documents\AL
Rename-Item C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.app C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.rar
Invoke-Item C:\Users\vmadmin\Documents\AL

#Extract rar
#Open VSCode
Remove-Item C:\ProgramData\navcontainerhelper\Extensions\navserver\my\EssentialBusinessHeadlines.app
Remove-Item C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines.rar -Force
Remove-Item C:\Users\vmadmin\Documents\AL\EssentialBusinessHeadlines -Force


