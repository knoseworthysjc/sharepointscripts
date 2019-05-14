$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url
$file = "Alpha Archive History.xlsx"

$data = Import-Excel -Path $file -WorksheetName "2019 Products" -DataOnly

for($i = 0; $i -lt $data.Count; $i++) 
{ 
$r = $data[$i];
}