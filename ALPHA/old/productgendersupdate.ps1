
$parentSite = "https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder"
Connect-PnPOnline -Url $parentSite -UseWebLogin
$mainlist = Get-PnPList -Identity Products
$mainlistfilter = (Get-PnPListItem -List $mainlist -Fields ID,gender,genders).FieldValues 

#Get-PnPField -List $list
$sublistname = "Gender"
$sublist = Get-PnPlist -Identity $sublistname
$sublistitems = (Get-PnPlistItem -List $sublist -Fields ID,Title).FieldValues 

Foreach ($item in $mainlistfilter) 
{
   $id = $item.ID;

   $old = $item['genders'];

   $newrec = $sublistitems | Where-Object { $_.Title -ieq $old}
   
   $new = $newrec.ID

   Set-PnPListItem -List $mainlist -Identity $id -Values @{"gender"=$new}
}

Disconnect-PnPOnline