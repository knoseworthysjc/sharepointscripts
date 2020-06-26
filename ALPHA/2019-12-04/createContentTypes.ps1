$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
Connect-PnPOnline -Url $url -useweblogin

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

$list = New-PnpList -Title "ProductStyles" -EnableContentTypes -EnableVersioning -OnQuickLaunch
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

$ctx = Get-PnPContext
$d = Add-PnPField -Group "Asset Management" -DisplayName "Featured Image" -InternalName "featuredimage" -Type "Lookup"
$d.LookupList = "38ca8eb8-6cad-4315-994e-3efa9a055f2a"
$d.LookupField = "title"
$d.update()
$ctx.ExecuteQuery()

Add-PnpTaxonomyField -Group "Product Management" -DisplayName "Item Number" -InternalName "itemnumber" -TermSetPath "AlphaBroderContent|ItemNumbers"

Add-PnpField -Group "Product Management" -DisplayName "productsizes" -InternalName "productsizes" -Type "Choice" -Choices "S-1XL","S-2XL","S-4XL","S-5XL","S-6XL","S-L","S-L/XL","S-XL","S/M, L/XL","S/M-2XL/3XL","S/M-L/XL","XLT-2XLT","XLT-2XT","XLT-3XLT","XLT-3XT","XLT-5XT","XS, S, M, L, XL","XS, S, M, L, XL, 2XL, 3XL","XS-2XL","XS-3XL","XS-4XL","XS-5XL","XS-6XL"

Add-PnPTaxonomyField -Group "Product Management" -DisplayName "Product Hierarchy" -InternalName "producthierarchy" -TermSetPath "AlphaBroderContent|Product Hierarchy"

Add-PnpField -Group "Styles Management" -DisplayName "Size Range" -InternalName "sizerange" -Type "Choice" -Choices "S-1XL","S-2XL","S-4XL","S-5XL","S-6XL","S-L","S-L/XL","S-XL","S/M, L/XL","S/M-2XL/3XL","S/M-L/XL","XLT-2XLT","XLT-2XT","XLT-3XLT","XLT-3XT","XLT-5XT","XS, S, M, L, XL","XS, S, M, L, XL, 2XL, 3XL","XS-2XL","XS-3XL","XS-4XL","XS-5XL","XS-6XL"

Add-PnpField -Group "Styles Management" -DisplayName "Size Group" -InternalName "sizegroup" -Type "Choice" -Choices "ONE SIZE","S, M, L","S, M, L, XL","S, M, L, XL, 2XL","S, M, L, XL, 2XL, 3XL, 4XL","S, M, L, XL, 2XL, 3XL, 4XL, 5XL","S, M, L, XL, 2XL, 3XL, 4XL, 5XL, 6XL","S, M, L/XL","S/M, L/XL","S/M, L/XL, 2XL/3XL","XLT, 2XT","XLT, 2XT, 3XT","XLT, 2XT, 3XT, 4XT, 5XT","XS, S, M, L","XS, S, M, L, XL, 1XL","XS, S, M, L, XL, 2XL","XS, S, M, L, XL, 2XL, 3XL","XS, S, M, L, XL, 2XL, 3XL, 4XL","XS, S, M, L, XL, 2XL, 3XL, 4XL, 5XL","XS, S, M, L, XL, 2XL, 3XL, 4XL, 5XL, 6XL","XS/S, M/L","XXS, XS, S, M, L, XL","XXS, XS, S, M, L, XL, 2XL","XXS, XS, S, M, L, XL, 2XL, 3XL, 4XL, 5XL","M, L","M, L, XL, 2XL, 3XL","M, L, XL, 2XL, 3XL, 4XL","2T, 3T, 4T","2T, 3T, 4T, 5/6","2T, 3T, 4T, 5/6, 7","2T, 3T, 4T, 5T","2T, 3T, 4T, 5T, 6T","2T, 4T, 5/6","2T/3T-4T","LT, XLT, 2XT, 3XT","LT, XLT, 2XT, 3XT, 4XT","LT, XLT, 2XT, 3XT, 4XT, 5XT","2, 4, 6","1 (14-16), 2 (18-20), 3 (22-24), 4 (26-28)","30, 32, 34, 36, 38, 40","32 X 30, 32 X 32, 32 X 34, 34 X 30, 34 X 32,34 X 34, 36 X 30, 36 X 32, 36 X 34, 38 X 30, 38 X 32, 38 X 34, 40 X 30, 40 X 32, 40 X 34, 42 X 30, 42 X 32, 42 X 34","NEWBORN","NEWBORN, 6MOS, 12MOS, 18MOS","NEWBORN, 6MOS, 12MOS, 18MOS, 24MOS","0-6MOS, 6-12MOS","3-6MOS, 6-12MOS, 12-18MOS, 18-24 MOS","3-6MOS, 6-12MOS, 12-18MOS, 18-24MOS","6MOS, 12MOS, 18MOS","6MOS, 12MOS, 18MOS, 24MOS"

Add-PnpField -Group "Styles Management" -DisplayName "Brand Names" -InternalName "brandnames" -Type "Choice" -Choices "A4","ACCESSORIES","Adams","Adidas","adidas Golf","All Sport","Alo Sport","AlphaBroder","Alstyle","Alternative","American Apparel","Anvil","ANVIL®","Augusta Sportswear","Authentic Pigment","Backpacker","Badger","BAGedge","Bayside","BELLA + CANVAS","BERNE","Big Accessories","Burnside","Carmel Towel Company","Champion","Champion®","CODE FIVE","Collegiate Cotton","Columbia","Comfort Colors®","ComfortWash by Hanes","CORE365™","Devon & Jones®","Dickies","DRI DUCK","Econscious","Extreme","Extreme®","Flexfit","Flexfit 110®","Flexfit 210®","Flexfit®","Flexfit® for Team 365®","Fruit of the Loom®","fūl","Gemline","Gildan","Gildan®","Gildan® DryBlend®","Gildan® Heavy Cotton™","Hanes","Harriton","Harriton®","Headsweats® for Team 365®","Holloway","Igloo®","J AMERICA","J. America","JERZEES®","LAT","Liberty Bags","MARMOT","N/A","Next Level","North End®","PUMA® Golf","PUMA® Sport","Rabbit Skins","Reprime Artisan Collection","SPYDER","SubliVie","Team 365®","Team 365™","Threadfast","Tie-Dye","Tie-Dye for Team 365®","Top Of The World","Towels Plus™","UltraClub®","UNDER ARMOUR","US Blanks","YP Classics™","Yupoong®"

$ctx = Get-PnPContext
$d = Add-PnPField -Group "Styles Management" -DisplayName "Companions" -InternalName "companions" -Type "Lookup"
$d.LookupList = "cfb32c38-cc74-412a-b3ce-00d1c3f3b226"
$d.LookupField = "title"
$d.update()
$ctx.ExecuteQuery()