#1. Open production environment
Start 'https://businesscentral.dynamics.com/'

#trial e-mail : 2ilham.fasi@hdprice.co
#trial password: Password12345$

#2. Create/Open Sandbox Environment - online
Start 'https://businesscentral.dynamics.com/sandbox'

#3. Create Sandbox Environment - locally 
# need to 
# download CreateBCSandbox.ps1 script
# change $accept_eula = $true
# change $containername = 'Your container name' (ex. airapps-sandbox)
# run script
Start 'http://airapps-sandbox/nav/'
Docker stop AirApps-Sandbox


#Links
#docker images
Start 'https://blogs.msdn.microsoft.com/freddyk/2018/04/16/which-docker-image-is-the-right-for-you/'
Start 'https://store.docker.com/community/images/microsoft/bcsandbox/tags'
