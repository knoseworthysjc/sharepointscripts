$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\WalmartContent - Project Assets\WK03Digital_2019_AllSBUs.xlsx"

$data = Import-Excel -Path $file -WorksheetName "Print Media" -DataOnly

$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
Add-PnpContentType -Name "MMS_DATA" -Group "Walmart Data" -ParentContentType $ct | Out-Null

function createField ($group, $ct, $name, $type) {
    $pattern = '[^a-zA-Z]'
    $internalname = $name.ToLower() -replace $pattern,""
  
    #Add-PnpField -Group $group -DisplayName $name -InternalName $internalname -Type $type
    assignField $ct $internalname
}
function createTaxonmyField ($group, $ct, $name, $path)
{
    $pattern = '[^a-zA-Z]'
    $internalname = $name.ToLower() -replace $pattern,""
    
    #Add-PnPTaxonomyField -Group $group -DisplayName $name -InternalName $internalname -TermSetPath $path
    assignField $ct $internalname
}
function assignField($ct, $name){
    Add-PnPFieldToContentType -ContentType $ct -Field $name
}

$group = "Walmart Data"
$ct = "MMS_DATA"
createTaxonmyField $group $ct "MMS Season" "WalmartTerms|Project Management|Projects"
createTaxonmyField $group $ct "MMS Project" "WalmartTerms|Project Management|Projects"

$rec = $data[0].PSObject.Properties
<#Foreach ($k in $rec)
{
    $name = $k.Name
    createField $ct $group $name "Text"
}#>
