$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "C:\Users\KevinNoseworthy\Desktop\tmpalphaupdate.xlsx"
$throttlecount = 0;

$data = Import-Excel -Path $file -WorksheetName "Sheet4" -DataOnly

for($i = 1200; $i -lt $data.count; $i++) 
{  
    $r = $data[$i]
   
    $r.item
    $id = $r.ID
    if($r.ID -gt 0)
    {
        $rord = @{}
        $rord.Add('style',$r.item)
        Set-PnPListItem -List "Products" -ContentType "Styles" -Identity $id -Values $rord
    }
    $throttlecount = $throttlecount + 1; 
    if($throttlecount -eq 100)
    {
        Start-Sleep -Seconds 5
        $throttlecount = 0
    }
    $throttlecount
}