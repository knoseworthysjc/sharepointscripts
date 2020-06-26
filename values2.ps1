$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
$conn = Connect-PnPOnline -Url $url

$file = "C:\\Users\\KevinNoseworthy\\St Joseph Communications, Content Group\\AlphaBroderContent - Project Files\\2020\\Performance Guide\\Archive\\Book1.xlsx"

$data = Import-Excel -Path $file -WorksheetName "MergedClient" -DataOnly 

for($i = 0; $i -lt $data.Count; $i++)
{

    $r = $data[$i]
    $id = $r."Styles.Id"
    $item = @{}
    $r.msrp_code
    if($r.msrp_code -ne $null -And $r.msrp_code -ne ""){
       
        $item.Add("msrpcode",$r.msrp_code)
        try{
        
            $item = Set-PnPListItem -List "Styles" -Identity $id -Values $item
            
        } catch {
            
        }
    }
    
    
}