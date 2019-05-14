$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url

$mainlist = Get-PnPList -Identity Products
$mainlistfilter = (Get-PnPListItem -List $mainlist -Fields ID,abstyles,brand,categories,subcategories).FieldValues

Foreach ($item in $mainlistfilter) 
{
$style = $item.abstyles.label
$brand = $item.brand.label
$category = $item.categories.label
$subcategory = $item.subcategories.label
   #Set-PnPListItem -List $mainlist -Identity $id -Values @{"gender"=$new}
   
   $str = $item.ID + "	" + $brand + "	" + $category + "	" + $subcategory
   write-host($str)
   
   Add-content ".\jsonfiles\createUpdate.log" -value $str -Encoding Unicode
}