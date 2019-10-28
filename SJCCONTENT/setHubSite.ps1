$url = "https://sjccontent.sharepoint.com/teams/SJCContent"
Connect-PnPOnline -Url $url
$web = Get-PnPWeb 
$web.FooterEnabled = $true 
$web.Update() 
Invoke-PnPQuery  