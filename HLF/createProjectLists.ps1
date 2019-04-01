$LogPath = "C:\Users\KevinNoseworthy\Documents\GitHub\powershellsharepoint\HLF\logs"
$logfileb = $LogPath + "\failed\folders.json"
$logfilea = $LogPath + "\failed\records.json"


$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url
$file = "All Data2.xlsx"

$data = Import-Excel -Path $file -WorksheetName "Flyers2" -DataOnly
 
    $sff = Add-PnPFolder -Name "TESTING" -Folder "Project Assets"
    $tf =  "Project Assets/TESTING/"
    $tff = Add-PnPFolder -Name "Newspaper" -Folder $tf
    $tff = Add-PnPFolder -Name "Flyers" -Folder $tf
    
for($i = 2008; $i -lt 2021; $i++){
    $sff = Add-PnPFolder -Name $i -Folder "Project Assets"
    $tf =  "Project Assets/" + $i + "/"
    $tff = Add-PnPFolder -Name "Newspaper" -Folder $tf
    $tff = Add-PnPFolder -Name "Flyers" -Folder $tf
}

for($i = 25; $i -lt $data.count; $i++) 
{    
    
    $rec = $data[$i]

    if($rec.project -ne ""){    
        $stra = ConvertTo-Json -InputObject $rec
        $str = $stra + ","       
        #Add-content .\taxonmy.txt -value $rec.season
    #Import-PnPTaxonomy -Terms $rec.season
    #write-host("Project:" + $rec.project)
    #Import-PnPTaxonomy -Terms $rec.project
    #Add-content .\taxonmy.txt -value $rec.project
    <#    
    for($y=1; $y -le $rec.totalpages; $y++) {
            $pgtax = $rec.project + "|" + $y
            write-host("Pages:" + $pgtax)
            #Import-PnPTaxonomy -Terms $pgtax
            Add-content .\taxonmy.txt -value $pgtax
    }#>
    write-host($rec.project);
    $record = @{}
    $record.Add("projecttype",$rec.projecttype)
    $record.Add("season",$rec.season)
    $record.Add("project",$rec.project)
    $record.Add("template",$rec.template)
    $record.Add("totalpages",$rec.totalpages)
    $record.Add("startdate",$rec.startdate)
    $record.Add("enddate",$rec.enddate)

    try{
            write-host("List Item:" + $record.project)
            #$record
            #$record
            Add-PnpListItem -List "Projects" -Values $record -ContentType "Projects"   
        } Catch {
            Add-content -Path $Logfilea -value $str
            Write-Host $_.Exception.Message -ForegroundColor Yellow      
        }
        
        try{
            $pf = $rec.season.replace("HLF TermStore|Campaign Navigation|","Project Assets/").replace("|","/")
            $pfreplace = $rec.season + "|" + $rec.projecttype + "|"
            $pfn = $rec.project.replace($pfreplace,"")
            #write-host("Folder:" + $pfn)
            Add-PnPFolder -Name $pfn -Folder $pf
        }
        Catch {
            Add-content -Path $Logfileb -value $str       
        }
        
    } else {
        #write-host("Record:" + $i)    
        }
    
}

#Import-PnPTaxonomy -Path .\taxonmy.txt -ErrorAction Continue