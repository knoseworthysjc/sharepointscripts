$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url
$file = "Alpha Archive History.xlsx"

$data = Import-Excel -Path $file -WorksheetName "Brands Categories Styles" -DataOnly

for($i = 990; $i -lt $data.count; $i++) 
{ 
$r = $data[$i]


if($r.abstyle) 
{
    $rord = @{};
    $rord.Add('abstyle',$r.abstyle.trim());

    if($r.subcategory){
        $rord.Add("categories","AlphaBroderContentTerms|Product Management|Categories|" + $r.category + "|" + $r.subcategory);
        $rord.Add("abstyles","AlphaBroderContentTerms|Product Management|Products|" + $r.brand + "|" + $r.category + "|" + $r.subcategory + "|" + $r.abstyle);
    } else {
        $rord.Add("categories","AlphaBroderContentTerms|Product Management|Categories|" + $r.category);
        $rord.Add("abstyles", "AlphaBroderContentTerms|Product Management|Products|" + $r.brand + "|" + $r.category + "|" + $r.abstyle);
    }
    #$ab = $r.abstyle
    #$abstyles = Get-PnpTerm -Identity $ab -Termgroup "AlphaBroderContentTerms" -Recursive -Termset "Product Management"
    #$abstyles
    #$rord.Add("abstyles",$abstyles.Id);
    if($r.millstyle -ne ""){
       $rord.Add("millstyle",$r.millstyle);
    }
    $rord.Add("brand", "AlphaBroderContentTerms|Product Management|Brands|" + $r.brand);
    $rord.Add("usstatus",$r.style_status);
    $rord.Add("styledescription",$r.short_description.replace("",""))
    $rord.Add("mainstyleattributes",$r.long_description.replace("",""))
    if($r.sub_description -ne ""){
        $rord.Add("subattributes",$r.sub_description.replace("",""))
    }
    $rord.Add("gender",$r.gender)
    $rord.Add("garmentfit",$r.garmentfit)
if($r.earthfriendly -eq "Y"){
    $rord.Add("earthfriendly",1)
}else {
    $rord.Add("earthfriendly",1)
}
$rord.Add("icons",$r.icons);

if($r.companionladies){
    try{
        $cl = Get-PnpTerm -Termset "Product Management" -Termgroup "AlphaBroderContentTerms" -Identity $r.companionladies  -Recursive 
        $rord.Add("companionladies",$cl)
    } catch {

    }
}
if($r.companiontall){
    try {
    $ct = Get-PnpTerm -Identity $r.companiontall -Termset "Product Management" -Termgroup "AlphaBroderContentTerms" -Recursive
    $rord.Add("companiontall",$ct)
} catch {

}
}
if($r.companionyouth){
    try{
    $cy = Get-PnpTerm -Identity $r.companionyouth -Termset "Product Management" -Termgroup "AlphaBroderContentTerms" -Recursive
    $rord.Add("companionyouth",$cy)
} catch {

}
}

$rord.Add("ussizegroup",$r.sizegroup)
$rord.Add("ussizerange",$r.sizerange)
$rord.Add("uscolorgrouping",$r.catalog_color_group)

Write-Host($r.abstyle + "   " + $r.brand + "    " + $r.category + "    " + $r.subcategory)
#$dataa = ConvertTo-Json($rord)
try{
    <#$json = ConvertTo-Json $rord
    $outfile = ".\jsonfiles\"+ $abstylerec + ".json"
    Add-content $outfile -value $json -Encoding Unicode
    #>
    
    $item = Add-PnpListItem -List "Products" -Values $rord -ContentType "Products"
    $str = $rord.abstyles + "   " + $item.Id
    Add-content ".\jsonfiles\create.log" -value $str -Encoding Unicode
    #Add-content ".\jsonfiles\create.log" -value $dataa -Encoding Unicode
} catch {
    $str = $rord.abstyles + "   False"
    $rord
    Add-content ".\jsonfiles\create.log" -value $str -Encoding Unicode
    #Add-content ".\jsonfiles\create.log" -value $data -Encoding Unicode
}

}

}
