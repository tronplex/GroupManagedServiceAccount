# GroupManagedServiceAccount
Working with group managed service accounts
Getting Ready

- In order for a gMSA to be installed on a server, ensure that server has RSAT installed:
	- Install-WindowsFeature RSAT-AD-PowerShell
- gMSAs can only be used to run services on domain-joined hosts running Windows Server 2012, or higher
- For automatic password and Service Principal Name (SPN) management, the domain needs to run at least Windows Server 2008
- gMSAs depends on the Key Distribution Service on domain controllers
	- Prepare the forest by running the following commands:
		- Import-Module ActiveDirectory
		- Add-KdsRootKey -EffectiveImmediately
			- Although this line specifies to be effective immediately, you will actually have to wait 10 hours for it to become active.
			- This ensures ample time to replicate to other domain controllers


How to do it

To create a gMSA, use the following lines on a system with the Active Directory Module for Window PowerShell installed:
- Import-Module ActiveDirectory
- New-ADServiceAccount MSAName -DNSHostname domaincontroller.domain.com -PrincipalAllowedToRetrieveManagedPassword "CN=AppServer,CN=Computers,DC=Domain,DC=com"

To install the gMSA on an application server so that it can be assigned to run a service, application, or application pool, use the following line:
- Install-ADServiceAccount -Identity MSAName


Applying a gMSA to a Service

- Launch Services and locate the service you wish to apply the newly created gMSA to
- Right-Click on the service and select Properties
- In the Log On tab, click the Browse button and locate the gMSA you wish to assign
- Clear the password field and click Apply
- Stop and Restart the service
