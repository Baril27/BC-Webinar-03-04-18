#1. Open production environment
Start 'https://businesscentral.dynamics.com/'

#trial e-mail : 2ilham.fasi@hdprice.co
#trial password: Password12345$

#2. Create Sandbox Environment - online
Start 'https://businesscentral.dynamics.com/sandbox'

#3. Create Sandbox Environment - locally 
# need to 
# download CreateBCSandbox.ps1 script
# change $accept_eula = $true
# change $containername = 'Your container name' (ex. airapps-sandbox)
# change $navdockerimage = 'microsoft/bcsandbox:12.0.21229.0-us' (bug)
# run script
Start 'http://airapps-sandbox/nav/'

#Links
#docker images
Start 'https://store.docker.com/community/images/microsoft/bcsandbox/tags'
