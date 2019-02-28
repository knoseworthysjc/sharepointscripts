
$parentSite = "https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder"
Connect-PnPOnline -Url $parentSite -UseWebLogin

#all products list
$mainlist = Get-PnPList -Identity Products 
$mainlistfilter = (Get-PnPListItem -List $mainlist  -Query "<View>
<Query>
    <Where>
        <IsNotNull>
            <FieldRef Name='subcategorys'/>
        </IsNotNull>
    </Where></Query></View>").FieldValues 

#Get Categories
$sublistname = "Sub-Categories"
$sublist = Get-PnPlist -Identity $sublistname
$sublistitems = (Get-PnPlistItem -List $sublist -Fields ID,category,subcategory).FieldValues


#$sublistitems
Foreach($sitem in $sublistitems)
{
   $c =$sitem["category"]
   $scid = $c.LookUpId
   $sc = $c.LookUpValue
   $ssc = $sitem["subcategory"]
   
}

Foreach ($item in $mainlistfilter) 
{
   $id = $item.ID
   $c = $item["category"]
   $category = $c.LookUpId
   $oldsub = $item["subcategorys"] 
  
   $newcategory = $sublistitems | Where-Object { $_.subcategory -ieq $oldsub -and $_.category.LookUpId -eq $category}
   
   write-host("Category:" + $c.LookUpValue + "`nOldSubcategory:" + $oldsub + "`nNewSubCategory:" + $newcategory.ID)

   Set-PnPListItem -List $mainlist -Identity $id -Values @{"subcategory"=$newcategory.ID}
}

#$sublistitems
Foreach($sitem in $sublistitems)
{
   $c =$sitem["category"]
   $scid = $c.LookUpId
   $sc = $c.LookUpValue
   $ssc = $sitem["subcategory"]
    #write-host($ssc);
}
Disconnect-PnPOnline