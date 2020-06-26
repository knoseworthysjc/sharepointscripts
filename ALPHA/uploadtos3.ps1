Import-Module AWSPowerShell
$files = Get-ChildItem "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\AlphaBroderContent - WebImages" -Filter "*.png" -Recurse | Where { ! $_.PSIsContainer } | Select Name,FullName
$log = "uploaded.log"
foreach($f in $files)
{
$key = 'images/' + $f.name
$f.name+"`t"+$key | Add-Content -path $log

$exists = aws s3api head-object --bucket "sjm_alphabroder-raw-images" --key "$key"

Write-S3Object -BucketName "sjm-alphabroder-raw-images" -File $f.FullName -Key "$key" -ProfileName aws -Region us-east-1 -CannedACLName bucket-owner-full-control
aws s3api put-object-acl --bucket "sjm-alphabroder-raw-images" --key $key --grant-read uri=http://acs.amazonaws.com/groups/global/AllUsers --grant-full-control id="5c0984a6616f2d2d921f31dc12dea0e66bf0032f675287859ceb6eb2fa06768c" 
}

