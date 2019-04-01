$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url

$imgct = Get-PnpContentType -Identity "Image" -InSiteHierarchy
$vidct = Get-PnpContentType -Identity "Video" -InSiteHierarchy
Add-PnpContentType -Name "Product Images" -Group "Asset Management" -ParentContentType $imgct | Out-Null
Add-PnpContentType -Name "Product Logos" -Group "Asset Management" -ParentContentType $imgct | Out-Null
Add-PnpContentType -Name "Product Icons" -Group "Asset Management" -ParentContentType $imgct | Out-Null
Add-PnpContentType -Name "Product Videos" -Group "Asset Management" -ParentContentType $vidct | Out-Null

<#Create Fields#>
Add-PnPTaxonomyField -Group "Asset Management" -DisplayName "Asset Brand" -InternalName "assetbrand" -TermSetPath "TermStore-AlphaBroderContent|Product Management|Brands"

Add-PnPTaxonomyField -Group "Asset Management" -DisplayName "Asset Category" -InternalName "assetcategory" -TermSetPath "TermStore-AlphaBroderContent|Product Management|Categories"

Add-PnPTaxonomyField -Group "Asset Management" -DisplayName "Asset Style" -InternalName "assetstyle" -TermSetPath "TermStore-AlphaBroderContent|Product Management|Categories"

Add-PnPTaxonomyField -Group "Asset Management" -DisplayName "Additional Styles" -InternalName "additionalstyles" -TermSetPath "TermStore-AlphaBroderContent|Product Navigation"

<#Add Fields to Content Type#>
Add-PnPFieldToContentType -Field "assetbrand" -ContentType "Product Images"
Add-PnPFieldToContentType -Field "assetbrand" -ContentType "Product Logos"
Add-PnPFieldToContentType -Field "assetbrand" -ContentType "Product Icons"
Add-PnPFieldToContentType -Field "assetbrand" -ContentType "Product Videos"

Add-PnPFieldToContentType -Field "assetcategory" -ContentType "Product Images"
Add-PnPFieldToContentType -Field "assetcategory" -ContentType "Product Logos"
Add-PnPFieldToContentType -Field "assetcategory" -ContentType "Product Icons"
Add-PnPFieldToContentType -Field "assetcategory" -ContentType "Product Videos"

Add-PnPFieldToContentType -Field "assetstyle" -ContentType "Product Images"
Add-PnPFieldToContentType -Field "assetstyle" -ContentType "Product Logos"
Add-PnPFieldToContentType -Field "assetstyle" -ContentType "Product Icons"
Add-PnPFieldToContentType -Field "assetstyle" -ContentType "Product Videos"

Add-PnPFieldToContentType -Field "additionalstyles" -ContentType "Product Images"
Add-PnPFieldToContentType -Field "additionalstyles" -ContentType "Product Logos"
Add-PnPFieldToContentType -Field "additionalstyles" -ContentType "Product Icons"
Add-PnPFieldToContentType -Field "additionalstyles" -ContentType "Product Videos"

Add-PnPFieldToContentType -Field "assignedprojects" -ContentType "Product Images"
Add-PnPFieldToContentType -Field "assignedprojects" -ContentType "Product Logos"
Add-PnPFieldToContentType -Field "assignedprojects" -ContentType "Product Icons"
Add-PnPFieldToContentType -Field "assignedprojects" -ContentType "Product Videos"