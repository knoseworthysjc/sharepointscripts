$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
$conn = Connect-PnPOnline -Url $url

$lib = Get-PnPList -Identity "Product Images"
