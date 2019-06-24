$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\AlphaBroderContent - Documents\Data Dump.xlsx"
$throttlecount = 0;

$data = Import-Excel -Path $file -WorksheetName "NewUSA" -DataOnly
<#
for($i = 0;$i -lt $data.Count; $i++)
{
    $rec = $data[$i]


    $term = "AlphaBroderContent|ItemNumbers|Styles|" + $rec.abstyle
    
    Add-content .\item-taxonmy.txt -value $term -Encoding Unicode
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
    $ts = $r.abstyle
    $rord.Add('style',$ts)
    $rord.Add('millstyle',$r.millstyle)

    $rord.Add('stylefamily',$r.stylefamilyid)

    $rord.Add('Brand',$r.brandid)
    $rord.Add('productcategory',$r.catid)
    
    $rord.Add('Sub_x002d_Category',$r.subcatid)
    $rord.Add('ustier',$r.ustier)
    $rord.Add('cdntier',$r.cdntier)
    $rord.Add('usstatus',$r.usstatus)
    $rord.Add('cdnstatus',$r.cdnstatus)
    $rord.Add('gender',$r.gender)
    $rord.Add('productdescription',$r."style description")
    $rord.Add('Attributes',$r."main style attributes")
    $rord.Add('subattributes',$r.subattributes)
    $rord.Add('earthfriendly',$r.earthfriendly)
    $rord.Add('garmentfit',$r.garmentfit)
    $rord.Add('icons',$r.icons)
    $rord.Add('productsizes',$r.sizerange)
    $rord.Add('sizegroup',$r.sizegroup)
    $rord.Add('colorgrouping',$r.catalog_color_group)
    $i
    $r.abstyle
    $r.Brand
    $item = Add-PnpListItem -List "Products" -Values $rord -ContentType "Styles"
    $throttlecount = $throttlecount + 1; 
    if($throttlecount -eq 100)
    {
        Start-Sleep -Seconds 5
        $throttlecount = 0
    }
    $throttlecount
}

}