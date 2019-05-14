Get-ChildItem jsonfiles -Filter '*.json' -File | Foreach { 
    $data = (Get-Content -Raw $_.FullName | Out-String | ConvertFrom-Json)
    $hash = @{}
foreach ($property in $data.PSObject.Properties) {
    $hash[$property.Name] = $property.Value
}
    $hash
    #Add-PnpListItem -List "Products" -Values $data
    }