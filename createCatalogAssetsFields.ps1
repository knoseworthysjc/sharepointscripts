$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url
$group = "Campaign Assets"

Add-PnPTaxonomyField -Group "Campaign Management" -DisplayName "Campaign Navigation" -InternalName "campaignnavigation" -TermSetPath "HLF TermStore|Campaign Navigation"

Add-PnPTaxonomyField -Group "Campaign Management" -DisplayName "Season" -InternalName "season" -TermSetPath "HLF TermStore|Campaign Management|Seasons" -Required

Add-PnPTaxonomyField -Group "Campaign Management" -DisplayName "Project" -InternalName "project" -TermSetPath "HLF TermStore|Campaign Management|Projects" -Required
