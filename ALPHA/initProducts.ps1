$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "SharePoint References.xlsx"
$throttlecount = 0;

Get-PnPFile -Url "/Shared Documents/SharePoint References.xlsx" -AsFile -Path "jsonfiles" -FileName $file -Force
$path = "jsonfiles/" + $file
$data = Import-Excel -Path $path -WorksheetName "existingProducts" -DataOnly
<#
for($i = 0;$i -lt $data.Count; $i++)
{
    $rec = $data[$i]

    if($rec.ID){}else{
    $term = "AlphaBroderContent|ItemNumbers|Styles|" + $rec.abstyle
    
    Add-content .\item-taxonmy.txt -value $term -Encoding Unicode
    }
}
Import-PnPTaxonomy -Path .\item-taxonmy.txt -ErrorAction Continue
#>

for($i = 0; $i -lt $data.count; $i++) 
{ 
    
$r = $data[$i]

if($r.abstyle) 
{
    $rord = @{};
    #$rord.Add('style',$r.abstyle)
    $s = "AlphaBroderContent|ItemNumbers|Styles|" + $r.abstyle
    $rord.Add('itemnumber',$s)
    $ts = $r.abstyle + "|" + "styles"
    $rord.Add('style',$ts)
    $rord.Add('millstyle',$r.millstyle)

    $rord.Add('stylefamily',$r.SFID)

    $rord.Add('Brand',$r.bid)
    $rord.Add('productcategory',$r.CID)
    
    $rord.Add('Sub_x002d_Category',$r.SUBCID)
    $rord.Add('ustier',$r.ustier)
    $rord.Add('cdntier',$r.cdntier)
    $rord.Add('usstatus',$r.usstatus)
    $rord.Add('cdnstatus',$r.cdnstatus)
    $rord.Add('gender',$r.gender)
    $rord.Add('productdescription',$r."short_description")
    $rord.Add('Attributes',$r."long_description")
    $rord.Add('subattributes',$r.subattributes)
    $rord.Add('earthfriendly',$r.earthfriendly)
    $rord.Add('garmentfit',$r.garmentfit)
    $rord.Add('icons',$r.icons)
    $rord.Add('productsizes',$r.sizerange)
    $rord.Add('sizegroup',$r.sizegroup)
    $rord.Add('colorgrouping',$r.catalog_color_group)
    $i
    $r.abstyle
    $throttlecount
    if($r.ID){
        $item = Set-PnPListItem -List "Products" -ID $r.ID -Values $rord -ContentType "Styles"
    }else{
        $item = Add-PnpListItem -List "Products" -Values $rord -ContentType "Styles"
    }
    $throttlecount = $throttlecount + 1; 
    if($throttlecount -eq 100)
    {
        Start-Sleep -Seconds 3
        $throttlecount = 0
    }
    
}

}