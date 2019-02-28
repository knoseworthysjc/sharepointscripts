[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/
$data = Import-Excel -Path "Termset Taxonmony.xlsx" -WorksheetName "Season Project Pages Styles" -DataOnly

$id = 76

$brands = "COLUMBIA","SPYDER","UNDER ARMOUR","MARMOT","J AMERICA",$dj,"ULTRACLUB®","TEAM 365®","HARRITON®"
$values = @{"Catalog_x0020_Brands"=$brands}
$item = Get-PnpListItem -List "Catalogs" -Id 76

for ($i = 0; $i -lt 2; $i++)
{
    $ids = {}
    $rec = $data[$i]
    $brands = $rec.Brands.split(",")
    for($y = 0; $y -lt $brands.count; $y++)
    {
           
        $b = ($brands[$y] -replace "Site Collection AlphBroader\|Catalog Management\|Brands\|", "" -replace "\|","" -replace '\"','').Trim()
        
        try{            
            $term = Get-PnPTerm -TermSet "Catalog Management" -TermGroup "Site Collection AlphBroader" -Recursive -Identity $b
            $term
            $ids += $term.Id
        }catch{

        }
        try{
            Set-PnPListItem -List "Catalogs" -Identity $item -Values @{"Catalog_x0020_Brands"={"78c39a19-1796-4868-a18b-94ff5c14d9d5"}}
        $ids
        }
    }
    <#try{
    Get-PnPTerm -TermSet "Catalog Management" -TermGroup "Site Collection AlphBroader" -Identity $b -Recursive
    }catch{
        
    }#>

}

#Set-PnPListItem -List "Catalogs" -Identity $item -Values @{"Catalog_x0020_Brands"={"f966e3ed-ac82-407f-b5da-4376df170f51","78c39a19-1796-4868-a18b-94ff5c14d9d5"}}
f966e3ed-ac82-407f-b5da-4376df170f51
cd1dd5f5-1f0b-45c2-be72-78d73e214eef