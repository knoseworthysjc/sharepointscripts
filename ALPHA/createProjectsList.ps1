$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

Connect-PnPOnline -Url $url
$file = "Alpha Archive History.xlsx"
$data = Import-Excel -Path $file -WorksheetName "Sheet2" -DataOnly

for($i = 0; $i -lt $data.count; $i++) 
{ 
$r = $data[$i]
$projects = $r.project2
$projects
Add-content -Path ".\projecttaxonmy.txt" -value $projects -Encoding Unicode
}
Import-PnPTaxonomy -Path ".\projecttaxonmy.txt" -ErrorAction Continue


for($i = 0; $i -lt $data.count; $i++) 
{ 
$r = $data[$i]

$season = $r.season2
$project = $r.project2
$brands = $r.$brands
$categories = $r.$categories

$rord = @{"projectseason"=$season;"projectname"=$project;"projectbrands"=$brands;"projectcategories"=$categories}
try{
    Add-PnpListItem -List "Projects" -Values $rord -ContentType "Projects" -ErrorAction Continue
    write-host($project + ":" + "Success")
}
catch {
    write-host($project + ":" + "Failed")
}
}
