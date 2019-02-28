
Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/

#Site Collection AlphBroader|Product Management|Style Family|Sweaters

$data = Import-Excel -Path "Termset Taxonmony.xlsx" -WorksheetName "Product Navigation Hirerarchy" -DataOnly

for ($i = 0; $i -lt $data.Count; $i++) 
{

    $a = $data[$i].brand
    $b = $data[$i].category
    $c = $data[$i].subcategory

    
    $term_a = "Site Collection AlphBroader|Product Navigation Hirearchy|" + $a + "|" + $b + "|" + $c
    
    
    Import-PnPTaxonomy -Terms $term_a
}