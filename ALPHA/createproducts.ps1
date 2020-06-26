$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
$conn = Connect-PnPOnline -Url $url

$file = "C:\\Users\KevinNoseworthy\\St Joseph Communications, Content Group\\AlphaBroderContent - Data Exports\\SJC AlphaBroder Live.xlsx"

$data = Import-Excel -Path $file -WorksheetName "USA Live DB" -DataOnly 

for($i = 1; $i -lt $data.count; $i++) 
{
     $r = $data[$i]
     $item = @{}
     $item.Add('title',$r.abstyle)
     $item.Add('millstyle',$r.abstyle)
     $item.Add('short_description',$r.short_description)

}