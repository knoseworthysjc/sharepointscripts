$parentSite = "https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder"
Connect-PnPOnline -Url $parentSite -UseWebLogin
$mainlist = Get-PnPList -Identity Products
$mainlistfilter = (Get-PnPListItem -List $mainlist -Fields ID,gender,genders).FieldValues 





#Get-PnPField -List $list
$sublistname = "Product Logos"
$sublist = Get-PnPlist -Identity $sublistname
$sublistitems = (Get-PnPlistItem -Id 1069 -List $sublist).FieldValues 

foreach($img in $sublistitems)
{
    #$img
   $id = $img.ID
   $Name = $img.FileLeafRef
   
   write-host("`nId:" + $id + "`nName" + $Name)
   $img
}

