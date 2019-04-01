
Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/

#Site Collection AlphaBroader|Product Management|Style Family|Sweaters

$data = Import-Excel -Path "2019 Buyers Guide Web Data Export.xlsx" -WorksheetName "DataAndColors" -DataOnly

for ($i = 0; $i -lt $data.Count; $i++) 
{

    $r = $data[$i]
    $style = $r.abstyle
    $brand = $r."USA Live.brand"
    $category = $r."USA Data Reference.category"
    $subcategory = $r."USA Data Reference.subcategory"
    $color = $r."USA Live.catalog_color_group - Copy"
    $sizegroup = $r."USA Live.sizegroup"
    $sizerng = $r."USA Live.sizerange"

    if($subcategory){
        $productnav =  "Site Collection AlphaBroader|Product Navigation|" + $brand + "|" + $category + "|" + $subcategory + "|" + $style   + "|" + $color
    }else{
        $productnav =  "Site Collection AlphaBroader|Product Navigation|" + $brand + "|" + $category  + "|" + $style + "|" + $color
    }
    $sg = "Site Collection AlphaBroader|Product Management|Size Groups|" + $sizegroup
    $sr = "Site Collection AlphaBroader|Product Management|Size Ranges|" + $sizerng
    $colornav = "Site Collection AlphaBroader|Product Management|Colors|" + $color
   
    $terms = $productnav,$colornav,$sg,$sr
    foreach ($term in $terms)
    {    
        $term
        Import-PnPTaxonomy -Terms $term
    }
}