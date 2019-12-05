$path = "\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES"

$items = Get-ChildItem $path -Recurse -ErrorAction SilentlyContinue -Depth 1 -Include *.tif | Select Name,FullName | Export-CSV -Path 'assetpaths.csv' -Delimiter "|"