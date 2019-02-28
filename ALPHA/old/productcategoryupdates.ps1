
$parentSite = "https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder"
Connect-PnPOnline -Url $parentSite -UseWebLogin
$mainlist = Get-PnPList -Identity Products
$mainlistfilter = (Get-PnPListItem -List $mainlist).FieldValues 

#Get-PnPField -List $list
$sublistname = "Categories"
$sublist = Get-PnPlist -Identity $sublistname
$sublistitems = (Get-PnPlistItem -List $sublist -Fields ID,Title).FieldValues 

Foreach ($item in $mainlistfilter) 
{
   $id = $item.ID;

   $old = $item['categorys'].replace("T_SHIRTS","T-Shirts")

   $newrec = $sublistitems | Where-Object { $_.Title -eq $old}
   
   $new = $newrec.ID

   Set-PnPListItem -List $mainlist -Identity $id -Values @{"category"=$new}
}

Disconnect-PnPOnline