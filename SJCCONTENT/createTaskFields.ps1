$url = "https://sjccontent.sharepoint.com/teams/StJosephContentBlueChip"

Connect-PnPOnline -Url $url
<#
$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
Add-PnpContentType -Name "Workfront Tasks" -Group "Project Management" -ParentContentType $ct | Out-Null
#>

function createField ($group, $ct, $name, $type) {
    $pattern = '[^a-zA-Z]'
    $internalname = $name.ToLower() -replace $pattern,""
   
    Add-PnpField -Group $group -DisplayName $name -InternalName $internalname -Type $type
    assignField $ct $internalname
}
function assignField($ct, $name){
    Add-PnPFieldToContentType -ContentType $ct -Field $name
}

$group = "Project Management"
$ct = "Workfront Tasks"

#createField $group $ct "Project Docket" "Text"
#createField $group $ct "Project Name" "Text"
#createField $group $ct "Workfront Event" "Text"
createField $group $ct "uniquetask" "text"
