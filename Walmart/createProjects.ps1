$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

#$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
#Add-PnpContentType -Name "Projects" -Group "Project Management" -ParentContentType $ct | Out-Null

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

$group = "Project Management"
$ct = "Projects"
createTaxonmyField $group $ct "Project Season" "WalmartTerms|Project Management|Projects"
createTaxonmyField $group $ct "Project Name" "WalmartTerms|Project Management|Projects"
#createField $group $ct "Project Docket" "Text"
#createField $group $ct "Project Description" "Note"
#Add-PnpField -Group "Product Management" -DisplayName "Project Type" -InternalName "projecttype" -Type "Choice" -Choices "","Digital","Digest","Flyer"
#Add-PnpFieldToContentType -ContentType "Projects" -Field "projecttype"

