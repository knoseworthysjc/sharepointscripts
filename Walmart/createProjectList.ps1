$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\WalmartContent - Documents\Sharepoint Content Creation.xlsx"
$data = Import-Excel -Path $file -WorksheetName "Projects" -DataOnly

<#for($i = 0; $i -lt $data.count; $i++) 
{ 
$r = $data[$i]
$projects = $r.projecttaxonmy
$projects
Add-content -Path ".\projecttaxonmy.txt" -value $projects -Encoding Unicode
}
Import-PnPTaxonomy -Path ".\projecttaxonmy.txt" -ErrorAction Continue
#>

for($i = 0; $i -lt $data.count; $i++) 
{ 
$r = $data[$i]

$season = $r.yeartaxonmy
$project = $r.projecttaxonmy
$type = $r.Type

$rord = @{"projectseason"=$season;"projectname"=$project;"projecttype"=$type;}
try{
    Add-PnpListItem -List "Projects" -Values $rord -ContentType "Projects" -ErrorAction Continue
    write-host($project + ":" + "Success")
}
catch {
    write-host($project + ":" + "Failed")
}
}
