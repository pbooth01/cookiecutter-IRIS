Include %occInclude

Class IRISConfig.Installer Extends IRISConfig.InstallerBase
{
	ClassMethod InstallPackageManager() As %Status
	{
		Set tSC = $$$OK
		Try
		{
			
			Set tSC = $system.OBJ.Load("/tmp/packagemanager/zpm.xml", "ck")
		}
		Catch (oException)
		{
			Set tSC = oException.AsStatus()
		}
		
		Quit tSC 
	}
		
	XData Install [ XMLNamespace = INSTALLER ]
	{
	<Manifest>

		<Log Text="Installing InterSystems package manager on" Level="0"/>
		<Invoke Class="IRISConfig.Installer" Method="InstallPackageManager" CheckStatus="true">
		</Invoke>

	</Manifest>
	}
}