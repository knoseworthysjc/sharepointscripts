$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
Connect-PnPOnline -Url $url

$records = Get-PnpListITem -List AssortmentSheets -Query "<View><Query><Where><Eq><FieldRef Name='GUID'/><Value Type='Guid'>bd6c5b3b-d960-4ee7-a02c-85dc6cd78cc3</Value></Eq></Where></Query></View>"