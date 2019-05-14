
$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\AlphaBroderContent - Documents\Excel Exports\2019 Products List and taxonomy.xlsx"

$data = Import-Excel -Path $file -WorksheetName "2019 Products" -DataOnly
$taxonmy = Import-Excel -Path $file -WorksheetName "Taxonomy" -DataOnly

for($i = 990; $i -lt 1000; $i++) 
{ 
    $r = $data[$i]

    if($r.abstyle) 
    {
        $rord = @{};
        $rord.Add('abstyle',$r.abstyle.trim()) 
    }

}

#Devon ＆ Jones®
Devon & Jones®

