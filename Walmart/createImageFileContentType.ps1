$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
Add-PnpContentType -Name "XinetImages" -Group "Xinet" -ParentContentType $ct | Out-Null

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

$group = "Xinet"
$ct = "XinetImages"

#createField $group $ct "FileID" "Number"
#createField $group $ct "Item_Number" "Text"
#createField $group $ct "FileName" "Text"
#createField $group $ct "FilePath" "Note"
#createField $group $ct "Keywords" "Note"
#createField $group $ct "UPC" "Text"
#createField $group $ct "CreateDate" "DateTime"
#createField $group $ct "ModifiedDate" "DateTime"
#createField $group $ct "AccessedDate" "DateTime"
#createField $note $ct "XinetBaseUrl" "Note"
#createTaxonmyField $group $ct "Product Categories" "WalmartTerms|Product Management|Categories"





