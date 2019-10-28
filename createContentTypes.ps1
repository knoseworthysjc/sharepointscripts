$url = "https://sjccontent.sharepoint.com/teams/HighlandFarmsContent"
Connect-PnPOnline -Url $url
$web = Get-PnPWeb 
$web.FooterEnabled = $true 
$web.Update() 
Invoke-PnPQuery  


$item = Get-PnpContentType -Identity "Item" -InSiteHierarchy

$pm = Add-PnpContentType -Name "Projects" -Group "Project Management" -ParentContentType $item | Out-Null
$pd = Add-PnpContentType -Name "Products" -Group "Product Management" -ParentContentType $item | Out-Null
