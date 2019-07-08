$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\AlphaBroderContent - Documents\Project Files\2019 Essential Outerwear Web Database.xlsx"
$throttlecount = 0;

$data = Import-Excel -Path $file -WorksheetName "OuterWearDB" -DataOnly

for($i = 0;$i -lt $data.Count; $i++)
{
    $rec = $data[$i]
    if($rec.IdForTerm){}else{
    $s = $rec."StylePaste".ToUpper().Trim()
    $term = "AlphaBroderContent|ItemNumbers|Styles|" + $s
    
    Add-content .\item-taxonmy.txt -value $term -Encoding Unicode
    }
}
#Import-PnPTaxonomy -Path .\item-taxonmy.txt -ErrorAction Continue