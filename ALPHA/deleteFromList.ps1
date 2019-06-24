$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url

$mainlist = Get-PnPList -Identity Products
$mainlistfilter = (Get-PnPListItem -List $mainlist -Field "ID").FieldValues 
$throttlecount = 0


Foreach ($item in $mainlistfilter) 
{
   $id = $item.ID
    $id
    Remove-PnPListItem -List $mainlist -Identity $id -Force

    $throttlecount = $throttlecount + 1
    if($throttlecount -eq 100)
    {
        Start-Sleep -Seconds 5
        $throttlecount = 0
    }
    $throttlecount
}