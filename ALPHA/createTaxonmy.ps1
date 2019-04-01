
$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent/"

Connect-PnPOnline -Url $url

$file = "Alpha Archive History.xlsx"
$data = Import-Excel -Path $file -WorksheetName "Brands Categories Styles" -DataOnly
for($i = 0;$i -lt $data.Count; $i++)
{
    $rec = $data[$i]

    $b = $rec.brand
    $c = $rec.category
    $sc = $rec.subcategory
    $s = $rec.abstyle

    $baseTerm = "AlphaBroderContentTerms|Products|"
    
    if($sc){
        $term = $baseTerm + $b + "|" + $c + "|" + $sc + "|" + $s
    } else {
        $term = $baseTerm + $b + "|" + $c + "|" + $s
    }
    Add-content .\brand-category-taxonmy.txt -value $term -Encoding Unicode
}

Import-PnPTaxonomy -Path .\brand-category-taxonmy.txt -ErrorAction Continue