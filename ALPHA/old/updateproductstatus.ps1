
$parentSite = "https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder"
Connect-PnPOnline -Url $parentSite -UseWebLogin
$mainlist = Get-PnPList -Identity Products
$mainlistfilter = (Get-PnPListItem -List $mainlist -Fields ID,cdnstatus,cdnstatuss,usstatus,usstatuss).FieldValues 

#Get-PnPField -List $list
$sublistname = "Style Status"
$sublist = Get-PnPlist -Identity $sublistname
$sublistitems = (Get-PnPlistItem -List $sublist -Fields ID,Title).FieldValues 

Foreach ($item in $mainlistfilter) 
{
   $id = $item.ID;

   $olda = $item['cdnstatuss'];
   $oldb = $item['usstatuss'];

   $newreca = $sublistitems | Where-Object { $_.Title -ieq $olda}
   $newrecb = $sublistitems | Where-Object { $_.Title -ieq $oldb}
   
   $newa = $newreca.ID
   $newb = $newrecb.ID

   Set-PnPListItem -List $mainlist -Identity $id -Values @{"cdnstatus"=$newa;"usstatus"=$newb}
}

Disconnect-PnPOnline