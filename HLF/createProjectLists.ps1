$LogPath = "C:\Users\KevinNoseworthy\Documents\GitHub\powershellsharepoint\HLF\logs"
$logfileb = $LogPath + "\failed\folders.json"
$logfilea = $LogPath + "\failed\records.json"


$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url
$file = "All Data2.xlsx"

$data = Import-Excel -Path $file -WorksheetName "Flyers2" -DataOnly
    
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

for($i = 0; $i -lt $data.count; $i++) 
{    
    
    $rec = $data[$i]
    $str = ConvertTo-Json -InputObject $rec

    if($rec.season -ne ""){    
        
    write-host("Season:" + $rec.season)
    
    Import-PnPTaxonomy -Terms $rec.season
    write-host("Project:" + $rec.project)
    Import-PnPTaxonomy -Terms $rec.project
        
    for($y=1; $y -le $rec.totalpages; $y++)
        {
            $pgtax = $rec.project + "|" + $y
            write-host("Pages:" + $pgtax)
            Import-PnPTaxonomy -Terms $pgtax
        }
     
        try{
            write-host("List Item:" + $rec.project)
            $item = Add-PnpListItem -List "Projects" -Values $rec -ContentType "Projects"   
        } Catch {
            Add-content -Path $Logfilea -value $str      
        }

        try{
            $pf = $rec.season.replace("HLF TermStore|Campaign Navigation|","Project Assets/").replace("|","/")
            $pfreplace = $rec.season + "|" + $rec.projecttype + "|"
            $pfn = $rec.project.replace($pfreplace,"")
            write-host("Folder:" + $pfn)
            $pff = Add-PnPFolder -Name $pfn -Folder $pf
        }
        Catch {
            Add-content -Path $Logfileb -value $str       
        }
    } else {
        write-host("Record:" + $i)    
        }
    
}