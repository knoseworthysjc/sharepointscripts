$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url
$file = "Image SKUS.xlsx"


$data = Import-Excel -Path $file -WorksheetName "sheet1" -DataOnly

for($i=0;$i -lt $data.count; $i++)
{
$rec = $data[$i]
Add-content .\skutaxonmy.txt -value $rec.term

}

Import-PnPTaxonomy -Path .\skutaxonmy.txt -ErrorAction Continue