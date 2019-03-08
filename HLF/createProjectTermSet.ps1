$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"
$file = "All Data.xlsx"
Connect-PnPOnline -Url $url

#Site Collection AlphaBroader|Product Management|Style Family|Sweaters

$data = Import-Excel -Path $file -WorksheetName "Flyers" -DataOnly

for($i = 0;$i -lt $data.Count; $i++)
{
    $term = $data[$i].Navigation
    $season = "HLF TermStore|Campaign Management|Seasons|" + $data[$i].Season
    $project = $data[$i].media
    $type  = $data[$i].CampaignType
    $projectterm = "HLF TermStore|Campaign Management|Projects|" + $type + "|" + $project
    #Import-PnPTaxonomy -Terms $season
    Import-PnPTaxonomy -Terms $term
    Import-PnPTaxonomy -Terms $projectterm
    $term
    $data[$i].Season
    $type
    $project
    $i
}

