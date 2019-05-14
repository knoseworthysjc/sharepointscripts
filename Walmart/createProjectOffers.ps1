$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

$ct = "Offers"
$group = "Project Management"

#$cto = Get-PnpContentType -Identity "Item" -InSiteHierarchy
#Add-PnpContentType -Name $ct -Group $group -ParentContentType $cto | Out-Null

function createField ($group, $ct, $name, $type) {
    $pattern = '[^a-zA-Z]'
    $internalname = $name.ToLower() -replace $pattern,""
  
    Add-PnpField -Group $group -DisplayName $name -InternalName $internalname -Type $type
    assignField $ct $internalname
}
function createTaxonmyField ($group, $ct, $name, $path)
{
    $pattern = '[^a-zA-Z]'
    $internalname = $name.ToLower() -replace $pattern,""
    
    Add-PnPTaxonomyField -Group $group -DisplayName $name -InternalName $internalname -TermSetPath $path
}
function assignField($ct, $name){
    Add-PnPFieldToContentType -ContentType $ct -Field $name
}

#createTaxonmyField $group $ct "Season" "WalmartTerms|Project Management|Projects"
#createTaxonmyField $group $ct "Project" "WalmartTerms|Project Management|Projects"
#createField $group $ct "Page" "Number"
#createField $group $ct "Adblock" "Number"
#createField $group $ct "Markets" "Number"
#createField $group $ct "Offer Copy" "Note"
#createField $group $ct "Featured Items" "Note"
#createTaxonmyField $group $ct "Offer SBU" "WalmartTerms|Project Management|SBU" 
#Add-PnpField -Group $group -DisplayName "Markets(Offers)" -InternalName "marketsoffers" -Type "Choice" -Choices "All","BC","MB","NB","NL","NS","ON","PE","QC","SK"
 createField $group $ct "Savings" "Number"
 createField $group $ct "Event Price(LB)" "Number"
 createField $group $ct "Regular Price(LB)" "Number"
 createField $group $ct "Savings(LB)" "Number"