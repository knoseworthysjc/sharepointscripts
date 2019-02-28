
Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/

#Site Collection AlphBroader|Product Management|Style Family|Sweaters

$data = Import-Excel -Path "2019 Buyers Guide Web Data Export.xlsx" -WorksheetName "USA Web Data Colors" -DataOnly

for ($i = 0; $i -lt 10; $i++) 
{

    $data[$i]
    $ab = $data[$i].abstyle
    <#
    $a = $data[$i].abstyle
    $c = $data[$i].category
    $sc = $data[$i].subcategory

    
    $term_a = "Site Collection AlphBroader|Product Navigation Hirearchy|" + $a + "|" + $b + "|" + $c
    
    
    Import-PnPTaxonomy -Terms $term_a
    #>
}