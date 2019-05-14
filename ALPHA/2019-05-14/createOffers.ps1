$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url
<#Create Content Type#>
$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
Add-PnpContentType -Name "Offers" -Group "Offer Management" -ParentContentType $ct | Out-Null

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Offer Season" -InternalName "offerseason" -TermSetPath "AlphaBroderContentTerms|Project Management|" -Required

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Offer Project" -InternalName "offerproject" -TermSetPath "AlphaBroderContentTerms|Project Management|" -Required

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Offer Page" -InternalName "offerpage" -TermSetPath "AlphaBroderContentTerms|Project Management|" -Required

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Offer Position" -InternalName "offerposition" -TermSetPath "AlphaBroderContentTerms|Project Management|" -Required

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Offer Styles" -InternalName "offerstyles" -TermSetPath "AlphaBroderContentTerms|Product Management|" -Required

<#Add Fields to Content Type#>
Add-PnPFieldToContentType -Field "offerseason" -ContentType "Offers"
Add-PnPFieldToContentType -Field "offerproject" -ContentType "Offers"
Add-PnPFieldToContentType -Field "offerpage" -ContentType "Offers"
Add-PnPFieldToContentType -Field "offerposition" -ContentType "Offers"
Add-PnPFieldToContentType -Field "offerstyles" -ContentType "Offers"