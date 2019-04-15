$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url

$file = "Alpha Archive History.xlsx"

$data = Import-Excel -Path $file -WorksheetName "Brands Categories Styles" -DataOnly

<#
$term = Get-PnpTerm -Identity Products -Termset "Product Management" -Termgroup "AlphaBroderContentTerms" -Recursive 
$ctx = $term.Context
$ctx.Load($term.Terms)
$ctx.ExecuteQuery()
$term.Terms
#>
$total = 0;
$productTerm = $cl = Get-PnpTerm -Termset "Product Management" -Termgroup "AlphaBroderContentTerms" -Identity Products  -Recursive
$productTerm

for($i = 0; $i -lt $data.count; $i++) 
{
$total
$r = $data[$i]


if($r.abstyle) 
{
    $r.abstyle

    $term = Get-PnpTerm -Termset "Product Management" -Termgroup "AlphaBroderContentTerms" -Identity $r.abstyle  -Recursive
    $ctx = $term.Context
    $term.Move($productTerm)
    
    $ctx.ExecuteQuery()

}

if ($total -gt 250) {
    Start-Sleep -Seconds 10
    $total = 0
}
$total++
}