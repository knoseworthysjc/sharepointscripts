$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\AlphaBroderContent - Documents\SharePoint References.xlsx"
$throttlecount = 0;

$data = Import-Excel -Path $file -WorksheetName "CreateColors" -DataOnly

for($i = 0;$i -lt $data.Count; $i++)
{
    $rec = $data[$i]

    $s = $rec."AB Style #".ToUpper().Trim()
    $term = "AlphaBroderContent|ItemNumbers|Styles|" + $s
    
    Add-content .\item-taxonmy.txt -value $term -Encoding Unicode
}
Import-PnPTaxonomy -Path .\item-taxonmy.txt -ErrorAction Continue


for($i = 0; $i -lt $data.count; $i++) 
{ 
    
$r = $data[$i]


if($r."AB Style #") 
{
    try{
    $style = $r."AB Style #".ToUpper().Trim()
    $rord = @{};
    $s = "AlphaBroderContent|ItemNumbers|Styles|" + $style
    $rord.Add('ContentType0',"Styles")
    $rord.Add('productcategory',$r.cid)
    $rord.Add('Brand',$r.bid)
    $rord.Add('Assigned_x0020_Item',$s)
    $rord.Add('colorname',$r."Color Name")
    $rord.Add('colorfamily',$r."Color Family")
    $rord.Add('usstatus',$r."Color Status US")
    $rord.Add('cdnstatus',$r."Color Status CDN")
    
    $rord.Add('ussizerange',$r."US Size Range")
    $rord.Add('cdnsizerange',$r."CDN Size Range")

    $rord.Add('hexcodecontrast',$r."Hex Code (Contrast)")
    $rord.Add('hexcodebody',$r."Hex Code (Main Body)")
    $rord.Add('pmscodecontrast',$r."PMS Code (Contrast)")
    $rord.Add('pmscodebody',$r."PMS Code (Main Body)")
    $rord.Add('unique',$r."unique")
    $rord.Add('featureditem',$r."ID")
    $rord.Add('colororder',$r."ColorOrder")
    $r.eid
    if($r.eid){
        $id = $r.eid
        $item = Set-PnPListItem -List "Product Colors" -ID $id -Values $rord
        write-host("" + $i + "|" + $style + "|" + $r."Color Name" + "|" + $throttlecount + "|" + $r.eid)
    } else {
        
        $item = Add-PnpListItem -List "Product Colors" -Values $rord -ContentType "Item"
        write-host("" + $i + "|" + $style + "|" + $r."Color Name" + "|" + $throttlecount + "|" + $item.ID)
    }
        $throttlecount = $throttlecount + 1; 
        if($throttlecount -eq 100)
        {
            Start-Sleep -Seconds 5
            $throttlecount = 0
        }
        
    } catch {
        write-host("" + $i + "|" + $style + "|" + $r."Color Name" + "|" + $throttlecount + "|" + $_.Exception.Message)
    }
}

}