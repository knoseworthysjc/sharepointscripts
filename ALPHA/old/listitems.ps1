
$parentSite = "https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder"
Connect-PnPOnline -Url $parentSite -UseWebLogin
$list = Get-PnPList -Identity Products
$items = (Get-PnPListItem -List $list -Query "<View>
<Query>
    <Where>
        <IsNotNull>
            <FieldRef Name='garmentfits'/>
        </IsNotNull>
    </Where></Query></View>").FieldValues 
#Get-PnPField -List $list
$gflist = Get-PnPlist -Identity "Garment Fits"
$gflistitems = (Get-PnPlistItem -List $gflist -Fields ID,Title).FieldValues 

Foreach ($item in $items) 
{
$id = $item.ID;
   $old = $item['garmentfits'].replace("null","").replace("-","")
   $newrec = $gflistitems | Where-Object { $_.Title -eq $old}
   $new = $newrec.ID
   $old 
   $new
   Set-PnPListItem -List $list -Identity $id -Values @{"garmentfit"=$new}
}

Disconnect-PnPOnline