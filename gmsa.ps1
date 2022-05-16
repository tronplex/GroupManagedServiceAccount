# INSTALL RAST ON THE DESIRED SERVER
Install-WindowsFeature RSAT-AD-PowerShell

# PREPARE THE FOREST BY RUNNING THE FOLLOWING
Import-Module ActiveDirectory
Add-KdsRootKey -EffectiveImmediately

# TO CREATE A GMSA, USE THE FOLLOWING LINES ON A SYSTEM WITH THE ACTIVE DIRECTORY MODULE FOR WINDOWS POWERSHELL INSTALLED
# Import-Module ActiveDirectory
# New-ADServiceAccount MSAName -DNSHostname domaincontroller.domain.com -PrincipalAllowedToRetrieveManagedPassword "CN=AppServer,CN=Computers,DC=Domain,DC=com"

# TO INSTALL THE GMSA ON AN APPLICATION SERVER SO IT CAN BE ASSIGNED TO RUN A SERVICE OR APPLICATION USE THE FOLLOWING
# Install-ADServiceAccount -Identity MSAName
