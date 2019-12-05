$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url
$file = "C:\Users\KevinNoseworthy\OneDrive - St Joseph Communications, Content Group\Holiday template 5-27 V2 PL (1).xlsx"
$throttlecount = 0;

$data = Import-Excel -Path $file -WorksheetName "Sheet1" -DataOnly

<#
for($i = 0;$i -lt $data.Count; $i++)
{
    $rec = $data[$i]

    $term = "AlphaBroderContent|ItemNumbers|Products|" + $rec.item
    
    Add-content .\product-taxonmy.txt -value $term -Encoding Unicode
}
Import-PnPTaxonomy -Path .\product-taxonmy.txt -ErrorAction Continue
#>

for($i = 0; $i -lt $data.count; $i++) 
{ 
    $i    
$r = $data[$i]

if($r.item) 
{
    $r.item
    if($r.IDS -gt 0){ 
        write-host("update")
        $rord = @{}
        $nc = if ($r."New Colors" -eq "FALSE"){$false}else{$true}
        $rord.Add('newcolors',$nc)
        $ex = if ($r."Exclusive" -eq "FALSE"){$false}else{$true}
        $rord.Add('exclusive',$ex)
        $pd = if ($r."Prime Design" -eq "FALSE"){$false}else{$true}
        $rord.Add('primedesigned',$pd)
        $id = $r.IDS
        $id
        Set-PnPListItem -List "Products" -ContentType "Products" -Identity $id -Values $rord
    } else {
        write-host("new")
    $rord = @{};
    #$rord.Add('style',$r.item)
    $s = "AlphaBroderContent|ItemNumbers|Products|" + $r.item
    $rord.Add('itemnumber',$s)
    $ts = "products|" + $r.item
    $rord.Add('style',$ts)
    $rord.Add('productcategory',$r.catid)
    $rord.Add('ustier',$r.ustier)
    $rord.Add('cdntier',$r.cdntier)
    $rord.Add('usstatus',$r.usstatus)
    $rord.Add('cdnstatus',$r.cdnstatus)
    $rord.Add('gender',$r.gender)
    $rord.Add('productdescription',$r."name")
    $rord.Add('Attributes',$r."data")
    
    $rord.Add('earthfriendly',$r.earthfriendly)
    
    
    $rord.Add('garmentfit',$r.garmentfit)
    $rord.Add('icons',$r.icons)
    $rord.Add('productsizes',$r.dimensions)
    
    $rord.Add('colorgrouping',$r.colors)
    $rord.Add('stdimprintarea',$r.imprintarea)
    $rord.Add('imprintsize',$r.imprintsize)
    $rord.Add('altimprintsize',$r.altsize)
    $rord.Add('altimprintarea',$r.altarea)
    $rord.Add('decorationmethod',$r.decorationmethods)
    $nc = if ($r."New Colors" -eq "FALSE"){$false}else{$true}
        $rord.Add('newcolors',$nc)
        $ex = if ($r."Exclusive" -eq "FALSE"){$false}else{$true}
        $rord.Add('exclusive',$ex)
        $pd = if ($r."Prime Design" -eq "FALSE"){$false}else{$true}
        $rord.Add('primedesigned',$pd)
        
    $item = Add-PnpListItem -List "Products" -Values $rord -ContentType "Products"
    }
    $throttlecount = $throttlecount + 1; 
    if($throttlecount -eq 20)
    {
        Start-Sleep -Seconds 5
        $throttlecount = 0
    }
    $throttlecount
}

}