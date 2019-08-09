$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

Get-PnPFile -Url "/teams/WalmartContent/Shared Documents/Excel Templates/Walmart FTP Export Template new.xlsm" -AsFile -Force


$excel = New-Object -Com Excel.Application
$excel.DisplayAlerts = $False
$excel.Visible = $False
start-sleep -Seconds 20
$tmp_ws = $excel.Workbooks.open((Get-Item -Path ".\").FullName + '.\Walmart FTP Export Template new.xlsm')
write-host "Opening & Refreshing Template" 
$tmp_ws.close($false)


Add-PnPFile -Path '.\Walmart FTP Export Template new.xlsm' -Folder '/Shared Documents/Excel Templates/'

$excel.Quit()
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel)


