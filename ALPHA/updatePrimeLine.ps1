$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "C:\Users\KevinNoseworthy\OneDrive - St Joseph Communications, Content Group\Holiday template 5-27 V2 PL (1).xlsx"
$throttlecount = 0;

$data = Import-Excel -Path $file -WorksheetName "Sheet1" -DataOnly

for($i = 0; $i -lt $data.count; $i++) 
{  
    $r = $data[$i]
    $r.item
    $r.qty1
    if($r.IDS -gt 0 -and $r.qty1 -gt 0)
    {
        $rord = @{}
        $rord.Add('quantity',$r.qty1)
        $id = $r.IDS
        Set-PnPListItem -List "Products" -ContentType "Products" -Identity $id -Values $rord
    }
}