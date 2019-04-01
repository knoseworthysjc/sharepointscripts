$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url
<#Create Content Type#>
$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
Add-PnpContentType -Name "Projects" -Group "Project Management" -ParentContentType $ct | Out-Null

<#Create Fields#>
Add-PnPTaxonomyField -Group "Project Management" -DisplayName "Project Season" -InternalName "projectseason" -TermSetPath "TermStore-AlphaBroderContent|Project Management|" -Required

Add-PnPTaxonomyField -Group "Project Management" -DisplayName "Project Name" -InternalName "projectname" -TermSetPath "TermStore-AlphaBroderContent|Project Management|" -Required

Add-PnPTaxonomyField -Group "Project Management" -DisplayName "Project Brands" -InternalName "projectbrands" -TermSetPath "TermStore-AlphaBroderContent|Product Management|Brands"

Add-PnPTaxonomyField -Group "Project Management" -DisplayName "Project Categories" -InternalName "projectcategories" -TermSetPath "TermStore-AlphaBroderContent|Product Management|Categories"

Add-PnpField -Group "Project Management" -DisplayName "Docket" -InternalName "docket" -Type "Text"

Add-PnpField -Group "Project Management" -DisplayName "Project Details" -InternalName "projectdetails" -Type "Note"

Add-PnpField -Group "Project Management" -DisplayName "Total Pages" -InternalName "totalpages" -Type "Number"

<#Add Fields To Content Type#>
Add-PnPFieldToContentType -Field "projectseason" -ContentType "Projects"
Add-PnPFieldToContentType -Field "projectname" -ContentType "Projects"
Add-PnPFieldToContentType -Field "totalpages" -ContentType "Projects"
Add-PnPFieldToContentType -Field "docket" -ContentType "Projects"
Add-PnPFieldToContentType -Field "projectdetails" -ContentType "Projects"
Add-PnPFieldToContentType -Field "projectbrands" -ContentType "Projects"
Add-PnPFieldToContentType -Field "projectcategories" -ContentType "Projects"
