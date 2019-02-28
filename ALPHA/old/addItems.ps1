
$username = "kevin.noseworthy@sjccontent.onmicrosoft.com"
$password = "Knoseworthy0808!"
$cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $userName, $(convertto-securestring $Password -asplaintext -force)
$conn = Connect-SPOService -Url https://sjccontent-admin.sharepoint.com/ -Credential $cred
$sitesInfo = Get-SPOSite -Identity "https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder"

#Retrieve and print all sites
foreach ($site in $sitesInfo)
{
    $site
    Write-Host 'Site collection:' $site.Url     
}    