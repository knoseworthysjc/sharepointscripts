
$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"

Connect-PnPOnline -Url $url

$dir = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\SJC HLF Content Admin - Product Assets"

Get-ChildItem $dir | 
Foreach-Object {

    $content = Get-Content $_.FullName
    $content

}




