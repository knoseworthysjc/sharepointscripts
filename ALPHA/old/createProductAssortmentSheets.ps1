Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/
<#$list = Get-PnpList -Identity "Lists/AB Styles"
$f = Get-PnpField -List $list
for ($i = 0; $i -lt $f.Count; $i++) {
    $f[$i].InternalName;
}
#>

$data = Import-Excel -Path "201901 PB Assortment Sheet_wPRIME_ (2018-07-03).xlsx" -WorksheetName "STYLES" -DataOnly
for ($i = 0; $i -lt $data.Count; $i++) 
{
    $rec
    try
    {
    
    $rec = $data[$i];
    $tbl = @{}
    $tbl.add("abstyle","Site Collection AlphaBroader|Product Management|Product Keys|" + $rec."AB Style")
    $tbl.add("brand","Site Collection AlphaBroader|Product Management|Brands|" + $rec.Brand)
    $tbl.add("productcategories","Site Collection AlphaBroader|Product Management|Categories|" + $rec.Category)
    $tbl.add("subcategories","Site Collection AlphaBroader|Product Management|Sub-Categories|" + $rec."Sub-Category")
    $tbl.add("ustier",$rec."US Tier")
    $tbl.add("cdntier",$rec."CDN Tier")
    $tbl.add("stylefamily","Site Collection AlphaBroader|Product Management|Style Family|" + $rec."Style Family")
    $tbl.add("usstatus",$rec."US Status")
    $tbl.add("cdnstatus",$rec."CDN Status")
    $tbl.add("gender",$rec."Gender")
    $tbl.add("styledescription",$rec."Style Description")
    $tbl.add("mainstyleattributes",$rec."Main Style Attributes")
    $tbl.add("subattributes",$rec."Sub-Attributes")
    $tbl.add("earthfriendly",$rec."Earth Friendly Style")
    $tbl.add("garmentfit",$rec."Garment Fit")
    $tbl.add("icons",$rec.Icons)
    $tbl.add("companionladies",$rec."Companion: Ladies'")
    $tbl.add("companiontall",$rec."Companion: Tall")
    $tbl.add("companionyouth",$rec."Companion: Youth")
    $tbl.add("descriptionofchange",$rec."Description of Change or status update (from previous publish date)")

    #$tbl
    #$rec
    
    try
    {
        Add-PnpListItem -List "Styles" -Values $tbl -Content Type
    } 
    catch{

    }
    }catch{

    }
}

