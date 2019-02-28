Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/
<#$list = Get-PnpList -Identity "Lists/AB Styles"
$f = Get-PnpField -List $list
for ($i = 0; $i -lt $f.Count; $i++) {
    $f[$i].InternalName;
}
#>

$data = Import-Excel -Path "2019 Buyers Guide.xlsx" -WorksheetName "2019 USA Buyers Guide Live" -DataOnly
for ($i = 0; $i -lt $data.Count; $i++) 
{
    $rec = $data[$i];
    $tbl = @{}
    $tbl.add("abstyle","Site Collection AlphaBroader|Product Management|Product Keys|" + $rec."abstyle")

    if($rec."millstyle" -and $rec."millstyle" -ne ""){
        $tbl.add("millstyle",$rec."millstyle")
    }

    $tbl.add("brand","Site Collection AlphaBroader|Product Management|Brands|" + $rec.brand)
    
    $tbl.add("productcategories","Site Collection AlphaBroader|Product Management|Categories|" + $rec.category)
    
    if($rec."subcategory" -and $rec."subcategory" -ne ""){
        $tbl.add("subcategories","Site Collection AlphaBroader|Product Management|Sub-Categories|" + $rec."subcategory")
        $tbl.add("Product_x0020_Navigation","Site Collection AlphaBroader|Product Management|Brands|" + $rec.brand + "|" + $rec.category + "|" +$rec."subcategory")
    }
    else{
        $tbl.add("Product_x0020_Navigation","Site Collection AlphaBroader|Product Management|Brands|" + $rec.brand + "|" + $rec.category )
    }

    $tbl.add("usstatus",$rec."style_status")
    
    $tbl.add("gender",$rec."gender")
    
    $tbl.add("styledescription",$rec."short_description")
    
    $tbl.add("mainstyleattributes",$rec."long_description")
    
    if($rec."sub_description" -and $rec."sub_description" -ne ""){
        $tbl.add("subattributes",$rec."sub_description")
    }

    if($rec."earthfriendly" -and $rec."earthfriendly" -ne ""){
        $tbl.add("earthfriendly",$rec."earthfriendly")
    }

    if($rec."garmentfit" -and $rec."garmentfit" -ne ""){
        $tbl.add("garmentfit",$rec."garmentfit")
    }
    if($rec."icons" -and $rec."icons" -ne ""){
        $tbl.add("icons",$rec.icons)
    }
    if($rec."companionladies" -and $rec."companionladies" -ne ""){
        $tbl.add("companionladies","Site Collection AlphaBroader|Product Management|Product Keys|" + $rec."companionladies")
    }
    if($rec."companiontall" -and $rec."companiontall" -ne ""){
        $tbl.add("companiontall","Site Collection AlphaBroader|Product Management|Product Keys|" + $rec."companiontall")
    }
    if($rec."companionyouth" -and $rec."companionyouth" -ne ""){
        $tbl.add("companionyouth","Site Collection AlphaBroader|Product Management|Product Keys|" + $rec."companionyouth")
    }
    $tbl.add("ussizegroup",$rec."sizegroup")
    $tbl.add("ussizerange",$rec."sizerange")
    $tbl.add("uscolorgrouping",$rec."catalog_color_group")

    try{
        $qry = "<View><Query><Where><Eq><FieldRef Name='abstyle'/><Value Type='TaxonomyFieldType'>" + $rec.abstyle + "</Value></Eq></Where></Query></View>"
        #$qry
        $item = Get-PnPListItem -List "Lists/AB Styles" -Query $qry
        #$item
        write-host($rec.abstyle)
        #$tbl
        if($item.Id)
        {
            write-host("Exists")
            Set-PnPListItem -List "Styles" -Identity $item.Id -Values $tbl
        }
        else{
            write-host("New")
           
            Add-PnpListItem -List "Styles" -Values $tbl
        }
    }
    catch{
        $_.Exception.Message
        $tbl
    }
    
}

