$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url

$mainlist = Get-PnPList -Identity Products
$mainlistfilter = (Get-PnPListItem -List $mainlist).FieldValues 


Foreach ($item in $mainlistfilter) 
{
   $id = $item.ID;
    $id
    Remove-PnPListItem -List $mainlist -Identity $id -Force
}

Disconnect-PnPOnline