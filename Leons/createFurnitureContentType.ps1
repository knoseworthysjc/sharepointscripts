$url = "https://sjccontent.sharepoint.com/teams/leonscontent/"

Connect-PnPOnline -Url $url

$group = "Product Management"
$ct = "Products"

$cta = Get-PnpContentType -Identity "Products" -InSiteHierarchy
Add-PnpContentType -Name "Loveseats" -Group "Product Management" -ParentContentType $cta | Out-Null

function createField ($group, $ct, $name, $type) {
    $pattern = '[^a-zA-Z]'
    $internalname = $name.ToLower() -replace $pattern,""
  
    Add-PnpField -Group $group -DisplayName $name -InternalName $internalname -Type $type
    assignField $ct $internalname
}
function createTaxonmyField ($group, $ct, $name, $path)
{
    $pattern = '[^a-zA-Z]'
    $internalname = $name.ToLower() -replace $pattern,""
    
    Add-PnPTaxonomyField -Group $group -DisplayName $name -InternalName $internalname -TermSetPath $path
}
function assignField($ct, $name){
    Add-PnPFieldToContentType -ContentType $ct -Field $name
}

createField $group $ct "Seating Springs" "Text"
createField $group $ct "Cushions" "Text"
createField $group $ct "Construction" "Text"
createField $group $ct "Fabric Content" "Text"
createField $group $ct "Finish" "Text"
createField $group $ct "Origin" "Text"
createField $group $ct "Style" "Text"
createField $group $ct "Warranty" "Note"
createField $group $ct "Care Instructions" "Text"