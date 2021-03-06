$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
$conn = Connect-PnPOnline -Url $url

$file = "C:\\Users\\KevinNoseworthy\\St Joseph Communications, Content Group\\AlphaBroderContent - Project Files\\2020\\Performance Guide\\Book1.xlsx"

$data = Import-Excel -Path $file -WorksheetName "MergedClient" -DataOnly 

for($i = 0; $i -lt $data.Count; $i++)
{

    $r = $data[$i]
    $id = $r."Styles.Id"
    $item = @{}
    $item.Add("web_description",$r.web_description)
    if($r.prime -ne $null -And $r.prime -ne ""){
        $item.Add("Tier",$r.prime)
    }
    if($r.tier -ne $null -And $r.tier -ne ""){
        $item.Add("web_tier",$r.tier)
    }
    $item.Add("MSRP",$r.msrp)
    $item.Add("msrpcode",$r.msrp_code)
    if ($r.companions -ne $null) { 
        $item.Add("companions",$r.Companion_IDs)
        $item.Add("styles",$r.Companion_IDs)    
    }
    if($r.IconsID -ne $null){
        $item.Add("icons",$r.IconsID)
    }
    $item.Add("icons_list",$r.icons)
    $item.Add("Projects",174)
    if($r.new -eq "NEW")
    {
        $item.Add("Style_x0020_Status","New")
    }
    Add-Content 'Log.text' $r
    Add-Content 'Log.text' $item
    try{
        
        $item = Set-PnPListItem -List "Styles" -Identity $id -Values $item
        Add-Content 'Log.text' "Success"
    } catch {
        Add-Content 'Log.text' "Errors"
    }
}