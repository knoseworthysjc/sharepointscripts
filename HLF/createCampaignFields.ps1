$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url
<#
$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
Add-PnpContentType -Name "Offers" -Group "Offer Management" -ParentContentType $ct | Out-Null

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Offer Navigation" -InternalName "offernavigation" -TermSetPath "HLF TermStore|Campaign Navigation"
Add-PnPFieldToContentType -Field "offernavigation" -ContentType "Offers"

Add-PnPFieldToContentType -Field "season" -ContentType "Offers"
Add-PnPFieldToContentType -Field "project" -ContentType "Offers"

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Offer Page" -InternalName "offerpage" -TermSetPath "HLF TermStore|Campaign Management|Pages"
Add-PnPFieldToContentType -Field "offerpage" -ContentType "Offers"

Add-PnpField -Group "Offer Management" -DisplayName "Position" -InternalName "position" -Type "Number"
Add-PnPFieldToContentType -ContentType "Offers" -Field "position"

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Featured Item" -InternalName "featureditem" -TermSetPath "HLF TermStore|Product Management|Product Keys"
Add-PnPFieldToContentType -ContentType "Offers" -Field "featureditem"

Add-PnPTaxonomyField -Group "Offer Management" -DisplayName "Offer Category" -InternalName "offercategory" -TermSetPath "HLF TermStore|Product Management|Categories"
Add-PnPFieldToContentType -ContentType "Offers" -Field "offercategory"

Add-PnpField -Group "Offer Management" -DisplayName "Offer Copy" -InternalName "offercopy" -Type "Note"
Add-PnPFieldToContentType -ContentType "Offers" -Field "offercopy"

Add-PnpField -Group "Offer Management" -DisplayName "Offer Price" -InternalName "offerprice" -Type "Currency"
Add-PnPFieldToContentType -ContentType "Offers" -Field "offerprice"

Add-PnpField -Group "Offer Management" -DisplayName "Offer Price/LB" -InternalName "offerpricelb" -Type "Currency"
Add-PnPFieldToContentType -ContentType "Offers" -Field "offerpricelb"

Add-PnpField -Group "Offer Management" -DisplayName "Offer Price/KG" -InternalName "offerpricekg" -Type "Currency"
Add-PnPFieldToContentType -ContentType "Offers" -Field "offerpricekg"

Add-PnpField -Group "Offer Management" -DisplayName "Offer Layout" -InternalName "offerlayout" -Type "Choice" -Choices "","1BOX","2BOX","4BOX"
Add-PnPFieldToContentType -ContentType "Offers" -Field "offerlayout"

Add-PnpField -Group "Offer Management" -DisplayName "Unit of Sale" -InternalName "unitofsale" -Type "Text"
Add-PnPFieldToContentType -ContentType "Offers" -Field "unitofsale"
#>
Add-PnpField -Group "Offer Management" -DisplayName "Measure" -InternalName "measure" -Type "Text"
Add-PnPFieldToContentType -ContentType "Offers" -Field "measure"

Add-PnpField -Group "Offer Management" -DisplayName "Instructions" -InternalName "instructions" -Type "Note"
Add-PnPFieldToContentType -ContentType "Offers" -Field "instructions"


<#Resuse Offer Management Fields
Season,offer,
#>

