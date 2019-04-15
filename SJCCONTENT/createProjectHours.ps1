$url = "https://sjccontent.sharepoint.com/teams/StJosephContentBlueChip"

Connect-PnPOnline -Url $url
#$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
#Add-PnpContentType -Name "Workfront Hours" -Group "Project Management" -ParentContentType $ct | Out-Null
function createField ($group, $ct, $name, $type) {
    $pattern = '[^a-zA-Z]'
    $internalname = $name.ToLower() -replace $pattern,""
  
    Add-PnpField -Group $group -DisplayName $name -InternalName $internalname -Type $type
    assignField $ct $internalname
}
function assignField($ct, $name) {
    Add-PnPFieldToContentType -ContentType $ct -Field $name
}

$group = "Hours Management"
$ct = "WorkFront Hours"
#createField $group $ct "Hours ID" "Text"
#createField $group $ct "Project Docket" "Text"
#createField $group $ct "Project Name" "Text"
#createField $group $ct "Task ID" "Text"
#createField $group $ct "Task Name" "Text"
#createField $group $ct "Employee Name" "Text"
#createField $group $ct "Employee ID" "Text"
#createField $group $ct "Employee Number" "Text"
#createField $group $ct "Logged Hours" "Number"
#createField $group $ct "Workfront Event" "Text"
#createField $group $ct "Workfront Team ID" "Text"
createField $group $ct "Hours Date" "DateTime"

Add-PnPTaxonomyField -Group "Product Management" -DisplayName "Assigned Styles" -InternalName "assignedstyles" -TermSetPath "AlphaBroderContentTerms|Product Management|Products"