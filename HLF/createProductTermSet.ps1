$url = "https://sjccontent.sharepoint.com/teams/SJCHLFContentAdmin"
$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\SJC HLF Content Admin - Documents\All Data.xlsx"
Connect-PnPOnline -Url $url

#Site Collection AlphaBroader|Product Management|Style Family|Sweaters

$data = Import-Excel -Path $file -WorksheetName "Flyers" -DataOnly



