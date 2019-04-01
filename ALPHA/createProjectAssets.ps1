$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url
<#Create Content Type#>
$ct = Get-PnpContentType -Identity "Rich Media Asset" -InSiteHierarchy
Add-PnpContentType -Name "Project Assets" -Group "Project Assets" -ParentContentType $ct | Out-Null

<#Create Fields#>
Add-PnPTaxonomyField -Group "Project Assets" -DisplayName "Asset Season" -InternalName "assetseason" -TermSetPath "TermStore-AlphaBroderContent|Project Management|Projects" -Required

Add-PnPTaxonomyField -Group "Project Assets" -DisplayName "Asset Project" -InternalName "assetproject" -TermSetPath "TermStore-AlphaBroderContent|Project Management|Projects" -Required

Add-PnPTaxonomyField -Group "Project Management" -DisplayName "Assigned Projects" -InternalName "assignedprojects" -TermSetPath "TermStore-AlphaBroderContent|Project Management|Projects" -Required

Add-PnpField -Group "Project Assets" -DisplayName "Local Path" -InternalName "localpath" -type "Note"

Add-PnpField -Group "Project Assets" -DisplayName "Asset Page Fr" -InternalName "assetpagefr" -type "Number"
Add-PnpField -Group "Project Assets" -DisplayName "Asset Page To" -InternalName "assetpageto" -type "Number"

Add-PnPTaxonomyField -Group "Project Assets" -DisplayName "Asset Page" -InternalName "assetpage" -TermSetPath "TermStore-AlphaBroderContent|Project Management|Projects"
<#Add Fields To Content Type#>
Add-PnPFieldToContentType -Field "assetseason" -ContentType "Project Assets"
Add-PnPFieldToContentType -Field "assetproject" -ContentType "Project Assets"
Add-PnPFieldToContentType -Field "assignedprojects" -ContentType "Project Assets"
Add-PnPFieldToContentType -Field "docket" -ContentType "Projects Assets"
Add-PnPFieldToContentType -Field "projectbrands" -ContentType "Project Assets"
Add-PnPFieldToContentType -Field "projectcategories" -ContentType "Project Assets"
Add-PnPFieldToContentType -Field "localpath" -ContentType "Project Assets"
Add-PnPFieldToContentType -Field "assetpagefr" -ContentType "Project Assets"
Add-PnPFieldToContentType -Field "assetpageto" -ContentType "Project Assets"
Add-PnPFieldToContentType -Field "assetpage" -ContentType "Project Assets"