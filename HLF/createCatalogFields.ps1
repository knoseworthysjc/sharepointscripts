$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url

Add-PnPTaxonomyField -Group "Campaign Management" -DisplayName "Campaign Navigation" -InternalName "campaignnavigation" -TermSetPath "HLF TermStore|Campaign Navigation"

Add-PnPTaxonomyField -Group "Campaign Management" -DisplayName "Season" -InternalName "season" -TermSetPath "HLF TermStore|Campaign Management|Seasons" -Required

Add-PnPTaxonomyField -Group "Campaign Management" -DisplayName "Project" -InternalName "project" -TermSetPath "HLF TermStore|Campaign Management|Projects" -Required

Add-PnpField -Group "Campaign Management" -DisplayName "Template" -InternalName "template" -Type "Choice" -Choices "","Highland","Highland Newspaper_RNP"

Add-PnpField -Group "Campaign Management" -DisplayName "Start Date" -InternalName "startdate" -Type "DateTime"

Add-PnpField -Group "Campaign Management" -DisplayName "End Date" -InternalName "enddate" -Type "DateTime"

Add-PnpField -Group "Campaign Management" -DisplayName "Total Pages" -InternalName "totalpages" -Type "Number"

Add-PnpField -Group "Campaign Management" -DisplayName "Docket #" -InternalName "docket" -Type "Text"

Add-PnpField -Group "Campaign Management" -DisplayName "Project Details" -InternalName "projectdetails" -Type "Note"

$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy

Add-PnpContentType -Name "Projects" -Group "Campaign Management" -ParentContentType $ct | Out-Null

Add-PnPFieldToContentType -Field "campaignnavigation" -ContentType "Projects"
Add-PnPFieldToContentType -Field "season" -ContentType "Projects"
Add-PnPFieldToContentType -Field "project" -ContentType "Projects"
Add-PnPFieldToContentType -Field "template" -ContentType "Projects"
Add-PnPFieldToContentType -Field "startdate" -ContentType "Projects"
Add-PnPFieldToContentType -Field "enddate" -ContentType "Projects"
Add-PnPFieldToContentType -Field "totalpages" -ContentType "Projects"
Add-PnPFieldToContentType -Field "docket" -ContentType "Projects"
Add-PnPFieldToContentType -Field "projectdetails" -ContentType "Projects"