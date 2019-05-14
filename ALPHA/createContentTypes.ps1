$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
Connect-PnPOnline -Url $url

$item = Get-PnpContentType -Identity "Item" -InSiteHierarchy
Add-PnpContentType -Name "Projects" -Group "Project Management" -ParentContentType $item | Out-Null
Add-PnpContentType -Name "Products" -Group "Product Management" -ParentContentType $item | Out-Null

#Add-PnPTaxonomyField -Group "Product Management" -DisplayName "AB Styles" -InternalName "abstyles" -TermSetPath "AlphaBroderContentTerms|Product Management|Products" -Required
#Add-PnpField -Group "Product Management" -DisplayName "Mill Style" -InternalName "millstyle" -Type "Text"

