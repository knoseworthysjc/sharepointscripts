$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
Connect-PnPOnline -Url $url

#$item = Get-PnpContentType -Identity "Item" -InSiteHierarchy
#Add-PnpContentType -Name "Projects" -Group "Project Management" -ParentContentType $item | Out-Null
#Add-PnpContentType -Name "Products" -Group "Product Management" -ParentContentType $item | Out-Null


#Add-PnPTaxonomyField -Group "Product Management" -DisplayName "AB Styles" -InternalName "abstyles" -TermSetPath "AlphaBroderContentTerms|Product Management|Products" -Required
#Add-PnpField -Group "Product Management" -DisplayName "Mill Style" -InternalName "millstyle" -Type "Text"

#Project Fields
#Add-PnpTaxonomyField -Group "Project Management" -DisplayName "Season" -InternalName "season" -TermSetPath "AlphaBroderContent|Project Management|Projects"

Add-PnpTaxonomyField -Group "Project Management" -DisplayName "Seasons" -InternalName "seasons" -TermSetPath "AlphaBroderContent|Project Management|Projects"

Add-PnpTaxonomyField -Group "Project Management" -DisplayName "Project" -InternalName "project" -TermSetPath "AlphaBroderContent|Project Management|Projects"

Add-PnpTaxonomyField -Group "Project Management" -DisplayName "Projects" -InternalName "projects" -TermSetPath "AlphaBroderContent|Project Management|Projects"

Add-PnpTaxonomyField -Group "Project Management" -DisplayName "Assigned Projects" -InternalName "assignedprojects" -TermSetPath "AlphaBroderContent|Project Management|Projects"
Add-PnpTaxonomyField -Group "Project Relations" -DisplayName "Assigned Project" -InternalName "assignedprojects" -TermSetPath "AlphaBroderContent|Project Management|Projects"

Add-PnpField -Group "Project Management" -DisplayName "Type" -InternalName "projecttype" -Type "Choice" -Choices "","Catalog","WebSite","HandTag"
Add-PnpField -Group "Project Management" -DisplayName "Docket" -InternalName "docket" -Type "Text"
Add-PnpField -Group "Project Management" -DisplayName "Details" -InternalName "projectdetails" -Type "Note"
Add-PnpField -Group "Project Management" -DisplayName "Total Pages" -InternalName "totalpages" -Type "Number"

#Product Fields
Add-PnPField -Group "Product Management" -DisplayName "Style" -InternalName "style" -Type "Text" -Required
Add-PnpField -Group "Product Management" -DisplayName "Styles" -InternalName "styles" -Type "Lookup" 
Add-PnpField -Group "Projuct Management" -DisplayName "Assigned Styles" -InternalName "assignedstyles" -Type "Lookup"
Add-PnpField -Group "Product Management" -DisplayName "US Tier" -InternalName "ustier" -Type "Choice" -Choices "","prime","companions","tier 4","primeplus","pre-closeout","new","closeout","dnr"
Add-PnpField -Group "Product Management" -DisplayName "CDN Tier" -InternalName "cdntier" -Type "Choice" -Choices "","prime","companions","tier 4","primeplus","pre-closeout","new","closeout","dnr"
Add-PnPTaxonomyField -Group "Product Management" -DisplayName "Style Family" -InternalName "stylefamily" -TermSetPath "AlphaBroderContent|Product Management|Style Family"
Add-PnPTaxonomyField -Group "Product Management" -DisplayName "Brand" -InternalName "brand" -TermSetPath "AlphaBroderContent|Product Management|Brands" -Required
Add-PnPTaxonomyField -Group "Product Management" -DisplayName "Categories" -InternalName "categories" -TermSetPath "AlphaBroderContent|Product Management|Categories"
Add-PnPTaxonomyField -Group "Product Management" -DisplayName "Category" -InternalName "productcategory" -TermSetPath "AlphaBroderContent|Product Management|Categories"
Add-PnpField -Group "Product Management" -DisplayName "US Status" -InternalName "usstatus" -Type "Choice" -Choices "","Active","Active/Catalog Only","New","New/Catalog Only","Not Available","DNR","AB-DROP"
Add-PnpField -Group "Product Management" -DisplayName "CDN Status" -InternalName "cdnstatus" -Type "Choice" -Choices "","Active","Active/Catalog Only","New","New/Catalog Only","Not Available","DNR","AB-DROP"
Add-PnpField -Group "Product Management" -DisplayName "Gender" -InternalName "gender" -Type "Choice" -Choices "","Men's","Ladies'","Adult","Youth","Unisex","Girls'","Toddler's","Infant","Kids","Baby","Infant Premium"
Add-PnpField -Group "Product Management" -DisplayName "Gender(FRE)" -InternalName "genderfre" -Type "Choice" -Choices "","Adolescent","Adult","Adulte","Bébé","Bébé Premium","Femme","Homme","Nourrissons","Pour Adolescent","Pour Adulte","Pour Aduolescent","Pour Enfant","Pour Femme","Pour Femmes","Pour Homme","Pour Hommes","Pour Unisex","Pour Unisexe","Tout-Petits","Unisex","Unisexe"
Add-PnpField -Group "Product Management" -DisplayName "Style Description" -InternalName "styledescription" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Main Style Attributes" -InternalName "mainstyleattributes" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Sub-Attributes" -InternalName "subattributes" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Earth Friendly" -InternalName "earthfriendly" -Type "Boolean"
Add-PnpField -Group "Product Management" -DisplayName "Garment Fit" -InternalName "garmentfit" -Type "Choice" -Choices "","N/A","Active","Athletic","Classic","Junior","Missy","Modern","Perfect","Relaxed","Tall"
Add-PnpField -Group "Product Management" -DisplayName "Garment Fit(FRE)" -InternalName "garmentfitfre" -Type "Choice" -Choices "","N/A","Actif","Active","Ajusté","Athlétique","Classique","Coupe Athlétique","Décontracté","Missy","Moderne","Parfait","Relaxed","Team","Équipe"
Add-PnpField -Group "Product Management" -DisplayName "Icons" -InternalName "icons" -Type "Note"
Add-PnPField -Group "Product Management" -DisplayName "Companion Ladies" -InternalName "companionladies" -Type "Lookup"
Add-PnPField -Group "Product Management" -DisplayName "Companion Tall" -InternalName "companiontall" -Type "Lookup"
Add-PnPField -Group "Product Management" -DisplayName "Companion Youth" -InternalName "companionyouth" -Type "Lookup"
Add-PnpField -Group "Product Management" -DisplayName "Description of Change" -InternalName "descriptionofchange" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Style Description(CDN)" -InternalName "styledescriptioncdn" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Main Style Attributes(CDN)" -InternalName "mainstyleattributescdn" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Sub-Attributes(CDN)" -InternalName "subattributescdn" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Style Description(FRE)" -InternalName "styledescriptionfre" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Main Style Attributes(FRE)" -InternalName "mainstyleattributesfre" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "Sub-Attributes(FRE)" -InternalName "subattributesfre" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "US Color Grouping" -InternalName "uscolorgrouping" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "CDN Color Grouping" -InternalName "cdncolorgrouping" -Type "Note"
Add-PnpField -Group "Product Management" -DisplayName "US Size Group" -InternalName "ussizegroup" -Type "Text"
Add-PnpField -Group "Product Management" -DisplayName "CDN Size Group" -InternalName "cdnsizegroup" -Type "Text"
Add-PnpField -Group "Product Management" -DisplayName "Fre Size Group" -InternalName "fresizegroup" -Type "Text"
Add-PnpField -Group "Product Management" -DisplayName "US Size Range" -InternalName "ussizerange" -Type "Text"
Add-PnpField -Group "Product Management" -DisplayName "CDN Size Range" -InternalName "cdnsizerange" -Type "Text"
Add-PnpField -Group "Product Management" -DisplayName "Fre Size Range" -InternalName "fresizerange" -Type "Text"

Add-PnPFieldToContentType -Field "seasons" -ContentType "Projects"
Add-PnPFieldToContentType -Field "project" -ContentType "Projects"
Add-PnPFieldToContentType -Field "projecttype" -ContentType "Projects"
Add-PnPFieldToContentType -Field "docket" -ContentType "Projects"
Add-PnPFieldToContentType -Field "projectdetails" -ContentType "Projects"
Add-PnPFieldToContentType -Field "totalpages" -ContentType "totalpages"

Add-PnPFieldToContentType -ContentType "Products" -Field "style"
Add-PnPFieldToContentType -ContentType "Products" -Field "millstyle"
Add-PnPFieldToContentType -ContentType "Products" -Field "ustier"
Add-PnPFieldToContentType -ContentType "Products" -Field "cdntier"
Add-PnPFieldToContentType -ContentType "Products" -Field "stylefamily"
Add-PnPFieldToContentType -ContentType "Products" -Field "brand"
Add-PnPFieldToContentType -ContentType "Products" -Field "categories"
Add-PnPFieldToContentType -ContentType "Products" -Field "usstatus"
Add-PnPFieldToContentType -ContentType "Products" -Field "cdnstatus"
Add-PnPFieldToContentType -ContentType "Products" -Field "gender"
Add-PnPFieldToContentType -ContentType "Products" -Field "genderfre"
Add-PnPFieldToContentType -ContentType "Products" -Field "styledescription"
Add-PnPFieldToContentType -ContentType "Products" -Field "mainstyleattributes"
Add-PnPFieldToContentType -ContentType "Products" -Field "subattributes"
Add-PnPFieldToContentType -ContentType "Products" -Field "earthfriendly"
Add-PnPFieldToContentType -ContentType "Products" -Field "garmentfit"
Add-PnPFieldToContentType -ContentType "Products" -Field "garmentfitfre"
Add-PnPFieldToContentType -ContentType "Products" -Field "icons"
Add-PnPFieldToContentType -ContentType "Products" -Field "companionladies"
Add-PnPFieldToContentType -ContentType "Products" -Field "companiontall"
Add-PnPFieldToContentType -ContentType "Products" -Field "companionyouth"
Add-PnPFieldToContentType -ContentType "Products" -Field "descriptionofchange"
Add-PnPFieldToContentType -ContentType "Products" -Field "uscolorgrouping"
Add-PnPFieldToContentType -ContentType "Products" -Field "ussizegroup"
Add-PnPFieldToContentType -ContentType "Products" -Field "ussizerange"

Add-PnPFieldToContentType -ContentType $ct -Field "styles"
Add-PnPFieldToContentType -ContentType $ct -Field "ussizegroup"
Add-PnPFieldToContentType -ContentType $ct -Field "ussizerange"
Add-PnPFieldToContentType -ContentType $ct -Field "cdnsizegroup"
Add-PnPFieldToContentType -ContentType $ct -Field "cdnsizerange"

Add-PnpTaxonomyField -Group "Product Management" -DisplayName "ColorName" -InternalName "colorname" -TermSetPath "AlphaBroderContent|Product Management|Colors"

<#
$list = "listname"
$ctx = Get-PnPContext
$lkField = Add-PnPField -List $list -DisplayName "fieldname" -InternalName "fieldname" -Type Lookup -AddToDefaultView
$lkField = $lookupField.TypedObject
$lkField.LookupList = "Lookup List ID"
$lkField.LookupField = "Lookup List field name"
$lkField.update()
$ctx.ExecuteQuery()
#>

$list = New-PnpList -Title "Products" -EnableContentTypes -EnableVersioning -OnQuickLaunch
Set-PnpView -List "Products(CDN)" -Identity "All Items" -Fields "","cdntier","stylefamily","brands","categories","cdnstatus","gender","styledescription","mainstyleattributes","subattributes","earthfriendly","garmentfit","icons","companionmens","companionladies","companiontall","companionyouth","descriptionofchange","colorgrouping","sizegroup","sizerange"

Set-PnpView -List "Products(FRE)" -Identity "All Items" -Fields "style","brands","categories","cdnstatus","gender","styledescription","mainstyleattributes","subattributes","icons","companionmens","descriptionofchange","colorgrouping","sizegroup","sizerange"

Set-PnpView -List "Products" -Identity "All Items" -Fields "Brand","productcategory","Sub-Category","Style","Mill Style","US Tier","CDN Tier","US Status","CDN Status","Gender","Style Description","Main Style Attributes","Sub-Attributes","Earth Friendly","Garment Fit","Icons","Size Range","Size Group","Color Grouping","Companion Men's","Companion Ladies","Companion Tall","Companion Youth","Description of Change"

$ctx = Get-PnPContext
$a = Add-PnPField -Group "Product Management" -DisplayName "Companion Mens" -InternalName "companionmens" -Type "Lookup"
$a.LookupList = "c2aad094-5078-4d66-860d-667ab799f705"
$a.LookupField = "style"
$a.update()

$b = Add-PnPField -Group "Product Management" -DisplayName "Companion Ladies" -InternalName "companionladies" -Type "Lookup"
$b.LookupList = "c2aad094-5078-4d66-860d-667ab799f705"
$b.LookupField = "style"
$b.update()
$c = Add-PnPField -Group "Product Management" -DisplayName "Companion Tall" -InternalName "companiontall" -Type "Lookup"
$c.LookupList = "c2aad094-5078-4d66-860d-667ab799f705"
$c.LookupField = "style"
$c.update()

$ctx = Get-PnPContext
$d = Add-PnPField -Group "Product Management" -DisplayName "Assigned Styles(Lookup)" -InternalName "assignedstyleslookup" -Type "Lookup"
$d.LookupList = "c2aad094-5078-4d66-860d-667ab799f705"
$d.LookupField = "style"
$d.update()
$ctx.ExecuteQuery()

Add-PnpTaxonomyField -Group "Product Management" -DisplayName "Item Number" -InternalName "itemnumber" -TermSetPath "AlphaBroderContent|ItemNumbers"

Add-PnpField -Group "Product Management" -DisplayName "productsizes" -InternalName "productsizes" -Type "Choice" -Choices "S-1XL","S-2XL","S-4XL","S-5XL","S-6XL","S-L","S-L/XL","S-XL","S/M, L/XL","S/M-2XL/3XL","S/M-L/XL","XLT-2XLT","XLT-2XT","XLT-3XLT","XLT-3XT","XLT-5XT","XS, S, M, L, XL","XS, S, M, L, XL, 2XL, 3XL","XS-2XL","XS-3XL","XS-4XL","XS-5XL","XS-6XL"