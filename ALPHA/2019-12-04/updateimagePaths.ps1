$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "C:\Users\KevinNoseworthy\Desktop\Book3.xlsx"
$throttlecount = 0;

$data = Import-Excel -Path $file -WorksheetName "Sheet2" -DataOnly

for($i = 0; $i -lt $data.count; $i++) 
{  
    $r = $data[$i]
   
    $rord = @{}
    $rord.Add("ContentType0","styles")
    $rord.Add("Cat_x0020_Reference",$r.catref)
    $rord.Add("Title",$r.Name)
    $rord.Add("Path",$r."FullName - Copy")
    $rord.Add("ItemNumber",$r.itemnumber)
    Add-PnpListItem -List "AssetPaths" -ContentType "Item" -Values $rord
    $throttlecount = $throttlecount + 1; 
    if($throttlecount -eq 100)
    {
        Start-Sleep -Seconds 5
        $throttlecount = 0
    }
    $throttlecount
}