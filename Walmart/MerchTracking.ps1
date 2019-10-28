$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"
Connect-PnPOnline -Url $url

$ct = Get-PnpContentType -Identity "Image" -InSiteHierarchy

Add-PnpContentType -Name "Merch Asset" -Group "Merch Management" -ParentContentType $ct | Out-Null

Add-PnpField -Group "Merch Management" -DisplayName "Tracking #" -InternalName "trackingnumber" -Type "Text"
Add-PnpField -Group "Merch Management" -DisplayName "Shipper" -InternalName "shipper" -Type "Choice" -Choices "","UPS","FEDEX","PUROLATOR","DHL"

Add-PnpField -Group "Merch Management" -DisplayName "Brand" -InternalName "brand" -Type "Text"
Add-PnpField -Group "Merch Management" -DisplayName "Season code/Year" -InternalName "seasoncodeyear" -Type "Text"
Add-PnpField -Group "Merch Management" -DisplayName "Dept" -InternalName "dept" -Type "Text"
Add-PnpField -Group "Merch Management" -DisplayName "Buyer" -InternalName "buyer" -Type "Text"
Add-PnpField -Group "Merch Management" -DisplayName "Style #" -InternalName "style" -Type "Text"

Add-PnpField -Group "Merch Management" -DisplayName "Size Range" -InternalName "sizerange" -Type "Choice" -Choices "S-L","S-XL","S-2XL","S-3XL","M"
Add-PnpField -Group "Merch Management" -DisplayName "Sample Size" -InternalName "samplesize" -Type "Choice" -Choices "XS","S","M","L","XL","2XL","3XL"
Add-PnpField -Group "Merch Management" -DisplayName "Quantity" -InternalName "quantity" -Type "Number"
Add-PnpField -Group "Merch Management" -DisplayName "Sample Color" -InternalName "samplecolor" -Type "Text"