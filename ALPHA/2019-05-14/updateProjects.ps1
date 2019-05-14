$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url

$file = "Alpha Archive History.xlsx"

$data = Import-Excel -Path $file -WorksheetName "Sheet5" -DataOnly
for($i = 0; $i -lt $data.count; $i++) 
{
    
    $r = $data[$i]
    $id = $r.Id
    $brands = '"' + $r.BrandsByGuid + '"'
    $categories = '"' + $r.CatagoriesByGuid + '"'
    
    
    if($id -gt 0)
    {
        $obj = @{"projectbrands"=$brands;"projectcategories"=$categories}
        try{
         $str = "Set-PnpListItem -List ""Projects"" -Identity " + $id + " -Values  @{""projectbrands""=" + $brands + ";}"
         $strb = "Set-PnpListItem -List ""Projects"" -Identity " + $id + " -Values  @{""projectcategories""=" + $categories + ";}"
         Add-content ".\updatecatalogsbrands.ps1" -value $str -Encoding Unicode
         Add-content ".\updatecatalogsbrands.ps1" -value $strb -Encoding Unicode
        }
        catch{

        }
    } else {
         
    }  

}
