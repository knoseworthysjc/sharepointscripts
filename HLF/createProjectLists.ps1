$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url
$file = "All Data.xlsx"

$data = Import-Excel -Path $file -WorksheetName "Flyers" -DataOnly

for ($i = 0; $i -lt 10; $i++) {
    $rec = $data[$i]
    #$rec
    $season = $rec.season
    $project = $rec.media 
    $template = $rec.mediatemplate
    $type = $rec.CampaignType
    $nav =  $data[$i].Navigation
    $tbl = @{}
    
    $tbl.add("campaignnavigation",$nav)
    
    $tbl.add("season","HLF TermStore|Campaign Management|Seasons|" + $season)
    
    $projectterm = "HLF TermStore|Campaign Management|Projects|" + $type + "|" + $project
    Import-PnPTaxonomy -Terms $projectterm

    $tbl.add("project",$projectterm)
    $tbl.add("totalpages",$rec."Total Pages")
    $tbl.add("startdate",$rec.fromdate)
    $tbl.add("enddate",$rec.finaldate)
    $tbl.add("template",$template)
    #$tbl.add("Title","")
    $tbl.add("projecttype",$type)
    $qry = "<View><Query><Where><And><Eq><FieldRef Name='season'/><Value Type='TaxonomyFieldType'>" + $season + "</Value></Eq><Eq><FieldRef Name='project'/><Value Type='TaxonomyFieldType'>" + $project + "</Value></Eq></And></Where></Query></View>"
    
    write-host($i);
    write-host($project);
    Add-PnpListItem -List "Projects" -Values $tbl -ContentType "Projects"
    <#$qry
    $item = Get-PnPListItem -List "Lists/Projects" -Query $qry
    if($item.Id)
        {
            write-host("Exists")
            Set-PnPListItem -List "Lists/Projects" -Identity $item.Id -Values $tbl
        }
        else{
            write-host("New")
            Add-PnpListItem -List "Projects" -Values $tbl -ContentType "Projects"
        }
    #>
   
    
}