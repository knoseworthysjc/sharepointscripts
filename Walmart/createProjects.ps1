$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

#$ct = Get-PnpContentType -Identity "Item" -InSiteHierarchy
#Add-PnpContentType -Name "Projects" -Group "Project Management" -ParentContentType $ct | Out-Null

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

$group = "Project Management"
$ct = "Projects"
createTaxonmyField $group $ct "Project Season" "WalmartTerms|Project Management|Projects"
createTaxonmyField $group $ct "Project Name" "WalmartTerms|Project Management|Projects"
Add-PnpField -Group "Project Management" -DisplayName "Season" -InternalName "season" -Type "Choice" -Choices "","2017","2018","2019","2020"
Add-PnpField -Group "Project Management" -DisplayName "Week" -InternalName "Week" -Type "Number"
Add-PnPField -Group "Project Management" -DisplayName "Campaign" -InternalName "Campaign" -Type "Choice" -Choices "", "Circular","Digital","Digest","Other"
Add-PnPTaxonomyField -Group "Project Management" -DisplayName "Project Hierarchy" -InternalName "projecthierarchy" -TermSetPath "WalmartTerms|Project Management|Projects"
Add-PnPField -Group "Project Management" -DisplayName "Docket" -InternalName "docket" -Type "Text" 
Add-PnPField -Group "Project Management" -DisplayName "Project Details" -InternalName "projectdetails" -Type "Note" 
#createField $group $ct "Project Docket" "Text"
#createField $group $ct "Project Description" "Note"
#Add-PnpField -Group "Project Management" -DisplayName "Project Type" -InternalName "projecttype" -Type "Choice" -Choices "","Digital","Digest","Flyer"
#Add-PnpFieldToContentType -ContentType "Projects" -Field "projecttype"

Add-PnPField -Group 'Offer Management' -DisplayName 'Featured Item Number' -InternalName 'featureditemnumber' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Country of Origin' -InternalName 'countryoforigin' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Grade' -InternalName 'grade' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Item Name' -InternalName 'itemname' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Copy Description' -InternalName 'copydescription' -Type 'Note' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Ad Block Theme' -InternalName 'adblocktheme' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'SBU' -InternalName 'sbu' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Portfolio Name' -InternalName 'portfolioname' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Category Name' -InternalName 'categoryname' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Page' -InternalName 'page' -Type 'Number' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Adblock #' -InternalName 'adblock' -Type 'Number' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Version' -InternalName 'version' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Markets' -InternalName 'markets' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Grid #' -InternalName 'grid' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Event Price' -InternalName 'eventprice' -Type 'Number' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Regular Price' -InternalName 'regularprice' -Type 'Number' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Price per' -InternalName 'priceper' -Type 'Number' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Offer Type' -InternalName 'offertype' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Promo Alignment' -InternalName 'promoalignment' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Comments' -InternalName 'comments' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Super Center Only' -InternalName 'supercenteronly' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Item Availibility (Merchant)' -InternalName 'itemavailibilitymerchant' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Item Availbility (Replenishment)' -InternalName 'itemavailbilityreplenishment' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'RFC' -InternalName 'rfc' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Available Online' -InternalName 'availableonline' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Multi Save (Deal Type)' -InternalName 'multisavedealtype' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Image Source' -InternalName 'imagesource' -Type 'Text' 
Add-PnPField -Group 'Offer Management' -DisplayName 'Picked Up From Week' -InternalName 'pickedupfromweek' -Type 'Text' 

Add-PnPField -Group 'Offer Management' -DisplayName 'Savings' -InternalName 'savings' -Type 'Number' 


Add-PnPField -Group 'Template Management' -DisplayName 'Template Name' -InternalName 'templatename' -Type 'Choice' -Choices "FP_alt","FP_standard","Template_10X21POP_A","Template_10x21POP_C","Template_8X21_inside","Template_8x21_FC","Template_8x21_GULP","Template_9X21_Inside","Template_9x21_","Template_9x21_2x8","Template_9x21_BC_legal","Template_9x21_FC","Template_H","Template_I","Template_J","Template_K","Template_L","Template_M","Template_N","Template_O","Template_P","Template_Q","Template_R","Template_R2e","Template_R2o","Template_T"

Add-PnPFieldToContentType -ContentType "Projects" -Field "templatename"