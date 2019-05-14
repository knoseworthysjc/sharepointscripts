$url = "https://sjccontent.sharepoint.com/teams/leonscontent/"

Connect-PnPOnline -Url $url

$group = "Product Management"
$ct = "Products"
function createField ($group, $ct, $name, $type) {
    $pattern = '[^a-zA-Z0-9]'
    $internalname = $name.ToLower() -replace $pattern,""
  
    Add-PnpField -Group $group -DisplayName $name -InternalName $internalname -Type $type
    assignField $ct $internalname
}
function createTaxonmyField ($group, $ct, $name, $path)
{
    $pattern = '[^a-zA-Z0-9]'
    $internalname = $name.ToLower() -replace $pattern,""
    
    Add-PnPTaxonomyField -Group $group -DisplayName $name -InternalName $internalname -TermSetPath $path
}
function assignField($ct, $name){
    Add-PnPFieldToContentType -ContentType $ct -Field $name
}

#createField $group $ct "Product Description" "Note"
#createField $group $ct "Product Dimensions" "Text"
#createField $group $ct "Unique Features" "Note"
#createField $group $ct "SKU" "TEXT"
#createTaxonmyField $group $ct "Product Collection" "LeonsTerms|Product Management|Collections"
#createField $group $ct "Featured LifeStyle" "Url"
#createField $group $ct "Additional LifeStyle" "Url"
#createField $group $ct "Featured Image" "Url"
#createField $group $ct "Additional Image 1" "Url"
#createField $group $ct "Additional Image 2" "Url"
#createField $group $ct "Additional Image 3" "Url"
#createField $group $ct "Additional Image 4" "Url"
#createField $group $ct "Additional Image 5" "Url"
#createField $group $ct "Additional Image 6" "Url"
#createField $group $ct "Additional Image 7" "Url"
createField $group $ct "Product Name" "Text"
