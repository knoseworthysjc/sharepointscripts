$folder = 'C:\Users\KevinNoseworthy\Desktop\TestZip\In\'
$filter = '*.*'                             # <-- set this according to your requirements
$destination = 'C:\Users\KevinNoseworthy\Desktop\TestZip\Out\log.txt'
$fsw = New-Object IO.FileSystemWatcher $folder, $filter -Property @{
 IncludeSubdirectories = $true              # <-- set this according to your requirements
 NotifyFilter = [IO.NotifyFilters]'FileName, LastWrite'
}
$onCreated = Register-ObjectEvent $fsw Created -SourceIdentifier FileCreated -Action {
 $path = $Event.SourceEventArgs.FullPath
 $name = $Event.SourceEventArgs.Name
 $changeType = $Event.SourceEventArgs.ChangeType
 $timeStamp = $Event.TimeGenerated
 $str = $path + "," + $name
 Add-Content -Path $destination -value $str -Encoding Unicode
 #Write-Host "The file '$name' was $changeType at $timeStamp"
}