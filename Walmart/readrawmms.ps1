$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"
Connect-PnPOnline -Url $url

 Write-Host ("Opening File " +$f.fullName)
 $name = $f.Name.split("_");
 
 $campaign = $name[0]
 $year = $name[1]
 
 $file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\WalmartContent - Project Assets\WK03Digital_2019_AllSBUs.xlsx"

 $data = Import-Excel -Path $file -WorksheetName "Print Media" -DataOnly

 for($i = 0; $i -lt $data.count; $i++) 
 {
    $rec = $data[$i].PSObject.Properties
    $obj = @{}
    Foreach ($k in $rec)
    {
        $name = $k.Name
        $pattern = '[^a-zA-Z]'
        $internalname = $name.ToLower() -replace $pattern,""
        
        $rord.Add($internalname,$k.Value) 
    }
 $obj
}