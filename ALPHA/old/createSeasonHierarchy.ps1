Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/

#Site Collection AlphBroader|Product Management|Style Family|Sweaters
#Get-PnpField -List "Lists/Catalogs"
$data = Import-Excel -Path "Termset Taxonmony.xlsx" -WorksheetName "Season Project Pages Styles" -DataOnly

for ($i = 0; $i -lt $data.count; $i++) {
    
    $rec = $data[$i]
    #$rec
    $s = $rec.season
    $p = $rec.project
    $ttlpgs = $rec.TotalPages
    $brands = $rec.Brands
    $categories = $rec.Categories
        
    $catnav = "Site Collection AlphBroader|Catalog Navigation|" + $s + "|" + $p
    $catseason = "Site Collection AlphBroader|Catalog Management|Season|" + $s
    $catproject = "Site Collection AlphBroader|Catalog Management|Project|" + $p

    try{
    Import-PnPTaxonomy -Terms $catnav
    }catch{}
    try{
    Import-PnPTaxonomy -Terms $catseason
    }catch{}
    try{
    Import-PnPTaxonomy -Terms $catproject
    }catch{}
    
    $project = @{}
    $project.add("Catalog_x0020_Season",$catseason)
    $project.add("Catalog_x0020_Projects",$catproject)
    $project.add("Catalog_x0020_Pages",$ttlpgs)
    $project.add("Catalog_x0020_Navigation",$catnav)

    $allbrands = ""
    $brands = $brands.split(",")
    for($x = 0; $x -lt $brands.count; $x++)
    {
        $b = $brands[$x] -replace '\"',''
        try{
            $term = Get-PnPTerm -TermSet "Catalog Management" -TermGroup "Site Collection AlphBroader" -Recursive -Identity $b
            $id = $term.Id
            if($id){
            $allbrands += '"' + $id + '",'
            }
        }catch{
            write-host('Error');
        }
    }
    $project.add("Catalog_x0020_Brands",$allbrands.Substring(0,$allbrands.Length - 2))
    
    $allcategories = ""
    $allcat = $categories.split(",")
    for($y = 0; $y -lt $allcat.count; $y++)
    {
        $c = $allcat[$y] -replace '\"',''
        try{
            $term = Get-PnPTerm -TermSet "Catalog Management" -TermGroup "Site Collection AlphBroader" -Recursive -Identity $c
            $id = $term.Id
            if($id){
            $allcategories += '"' + $id + '",'
            }
        }catch{
            write-host('Error');
        }
    }

    $project.add("Catalog_x0020_Catagories",$allcategories.Substring(0,$allcategories.Length -2))


    try{
        #$f = $s +"-"+$p + ".json"
    $str = 'Add-PnpListItem -List "Catalogs" -ContentType "Catalog Projects" -Values @{
        "Catalog_x0020_Season"="' + $project.Catalog_x0020_Season +'";
        "Catalog_x0020_Projects"="' + $project.Catalog_x0020_Projects +'";
        "Catalog_x0020_Navigation"="' + $project.Catalog_x0020_Navigation +'";
        "Catalog_x0020_Pages"="' + $project.Catalog_x0020_Pages +'";
        "Catalog_x0020_Brands"=' + $project.Catalog_x0020_Brands +'";
        "Catalog_x0020_Catagories"=' + $project.Catalog_x0020_Catagories +'";}'
        Invoke-Expression $str
    #Add-PnpListItem -List "Catalogs" -ContentType "Catalog Projects" -Values $project 
    }catch{
        $ErrorMessage = $_.Exception.Message
        $ErrorMessage
    }
    <#@{
        "Catalog_x0020_Projects"="Site Collection AlphBroader|Catalog Management|Project|USA Hang Tags";
        "Catalog_x0020_Navigation"="Site Collection AlphBroader|Catalog Navigation|HangTags|USA Hang Tags";
        "Catalog_x0020_Season"="Site Collection AlphBroader|Catalog Management|Season|HangTags";
        "Catalog_x0020_Pages"=36;
        "Catalog_x0020_Catagories"="4fa7bc3a-ad31-4ff4-b8ac-c7236bdf9bc0","eb820b4e-14f2-4265-9fb3-358126a4698e","73c55fd4-ec62-4219-a551-2bae273cbab2","376d4f66-70da-4fca-bbd7-0d7b40191158";
        "Catalog_x0020_Brands" = "78c39a19-1796-4868-a18b-94ff5c14d9d5","a6eee94a-2386-4258-8668-5e628728bc3b";
    }#>
    #$project
    <#
    Add-PnpListItem -List "Catalog Management" -Values $season -ContentType "Catalog Season"
    Add-PnpListItem -List "Catalog Management" -Values $project -ContentType "Catalog Project"
    #>

    <#$term_a = "Site Collection AlphBroader|Catalog Navigation|" + $s + "|" + $p + "|" + $pg + ""
    $term_b = "Site Collection AlphBroader|Catalog Management|Seasons|" + $s
    $term_c = "Site Collection AlphBroader|Catalog Management|Projects|" + $p
    $term_d = "Site Collection AlphBroader|Catalog Management|Pages|" + $pg#>

    
    <#Import-PnPTaxonomy -Terms $term_b
    Import-PnPTaxonomy -Terms $term_c
    Import-PnPTaxonomy -Terms $term_d#>

}
#Import-PnPTaxonomy -Terms $keys
