$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

$ct = Get-PnpContentType -Identity "Document" -InSiteHierarchy
Add-PnpContentType -Name "SJC_MMS" -Group "Project Assets" -ParentContentType $ct | Out-Null

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

$group = "Project Assets"
$ct = "SJC_MMS_Files"
#createTaxonmyField $group $ct "Asset Season" "WalmartTerms|Project Management|Projects"
#createTaxonmyField $group $ct "Asset Project" "WalmartTerms|Project Management|Projects"
assignField $ct "assetseason"
assignField $ct "assetproject"