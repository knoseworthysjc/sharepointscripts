Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/

$termset = Get-PnPTermSet -Termgroup "Site Collection AlphBroader"
Export-PnPTaxonomy -Termset $termset