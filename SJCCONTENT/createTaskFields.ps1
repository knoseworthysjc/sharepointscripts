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

createField $group $ct "Project Docket" "Text"
createField $group $ct "Project Name" "Text"
createField $group $ct "Task ID" "Text"
createField $group $ct "Task Name" "Text"
createField $group $ct "Employee Name" "Text"
createField $group $ct "Employee ID" "Text"
createField $group $ct "Logged Hours" "Number"

At first i was thinking most of the data is common but now thinking 3 lists, 
"Projects" -> just stores project name, docket details, 
"Project Tasks" for when projects are created to grab the planned hours for each of the tasks assigned to the project
"User tasks" for when users assing hours to the task 