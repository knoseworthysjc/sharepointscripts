$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url
<#
$fct = Get-PnpContentType -Identity "Folder" -InSiteHierarchy
$dct = Get-PnpContentType -Identity "Document" -InSiteHierarchy

Add-PnpContentType -Name "Project Folder" -Group "Campaign Management" -ParentContentType $fct | Out-Null
Add-PnpContentType -Name "Project Asset" -Group "Campaign Management" -ParentContentType $dct | Out-Null

Add-PnPFieldToContentType -Field "campaignnavigation" -ContentType "Project Folder"
Add-PnPFieldToContentType -Field "campaignnavigation" -ContentType "Project Asset"
#>

<# Pick up Fields From Projects #>
Add-PnPFieldToContentType -Field "template" -ContentType "Project Asset"
Add-PnPFieldToContentType -Field "pagefrom" -ContentType "Project Asset"
Add-PnPFieldToContentType -Field "season" -ContentType "Project Asset"
Add-PnPFieldToContentType -Field "project" -ContentType "Project Asset"
Add-PnPFieldToContentType -Field "template" -ContentType "Project Asset"
Add-PnPFieldToContentType -Field "featureditem" -ContentType "Project Asset"