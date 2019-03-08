$LogPath = "C:\Users\KevinNoseworthy\Documents\GitHub\powershellsharepoint\HLF\logs"

$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url
$file = "All Data2.xlsx"

$data = Import-Excel -Path $file -WorksheetName "Flyers3" -DataOnly
    
    <#$sff = Add-PnPFolder -Name "TESTING" -Folder "Project Assets"
    $tf =  "Project Assets/TESTING/"
    $tff = Add-PnPFolder -Name "Newspaper" -Folder $tf
    $tff = Add-PnPFolder -Name "Flyers" -Folder $tf
    
for($i = 2008; $i -lt 2021; $i++){
    $sff = Add-PnPFolder -Name $i -Folder "Project Assets"
    $tf =  "Project Assets/" + $i + "/"
    $tff = Add-PnPFolder -Name "Newspaper" -Folder $tf
    $tff = Add-PnPFolder -Name "Flyers" -Folder $tf
}#>

for ($i = 0; $i -lt $data.length; $i++) 
{
    
    
    $rec = $data[$i]
    $logobj = ConvertTo-Json -InputObject $rec
    #$rec
    $projecttype = $rec.projecttype
    $season = $rec.season
    $project = $rec.project
    $docket = $rec.docket
    $template = $rec.template
    $totalpages = $rec.totalpages
    $startdate = $rec.startdate
    $enddate = $rec.enddate
    $campaignnavigation = $rec.campaignnavigation
    $rec
    try{
        $projectterm = "HLF TermStore|Campaign Management|Projects|" + $projecttype + "|" + $project
        Import-PnPTaxonomy -Terms $campaignnavigation
        Import-PnPTaxonomy -Terms $projectterm
    } Catch {
        
    }
       
    $logfilename = $season.replace("|","-") + "_" + $project.replace("|","-") + ".json"
    $pf = "Project Assets/" + $season + "/" + $projecttype 
    $logfile = $LogPath + "\failed\" + $logfilename
    $str = ConvertTo-Json -InputObject @{input=$tbl;rec=$rec}
    #Add-content $Logfile -value $str
        try{
            $item = Add-PnpListItem -List "Projects" -Values $rec -ContentType "Projects"
        } Catch {
            
        }
        <#
        try {
            $pff = Add-PnPFolder -Name $project -Folder $pf   
        } Catch {
            
        }#>    
    
    
    
}