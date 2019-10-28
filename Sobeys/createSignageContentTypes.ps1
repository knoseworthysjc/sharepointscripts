$url = "https://sjccontent.sharepoint.com/teams/SobeysContent/"
Connect-PnPOnline -Url $url

#$item = Get-PnpContentType -Identity "Item" -InSiteHierarchy