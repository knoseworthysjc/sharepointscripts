
$parentSite = "https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder"
Connect-PnPOnline -Url $parentSite -UseWebLogin
$mainlist = Get-PnPList -Identity Products
$mainlistfilter = (Get-PnPListItem -List $mainlist -Fields ID,cdnstatus,cdnstatuss,usstatus,usstatuss).FieldValues 

#Get-PnPField -List $list
$sublistname = "Style Family"
$sublist = Get-PnPlist -Identity $sublistname
$sublistitems = (Get-PnPlistItem -List $sublist -Fields ID,Title).FieldValues 

Foreach ($item in $mainlistfilter) 
{
   $id = $item.ID;

   $olda = $item['stylefamilys'];

   $newreca = $sublistitems | Where-Object { $_.Title -ieq $olda}
   
   $newa = $newreca.ID

   Set-PnPListItem -List $mainlist -Identity $id -Values @{"stylefamily"=$newa}
}

Disconnect-PnPOnline