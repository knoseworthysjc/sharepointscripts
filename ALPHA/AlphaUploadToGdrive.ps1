#$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
#Connect-PnPOnline -Url $url

# Config
$Username = "BBimages"
$Password = "brodimgs"
$RemoteFile = "ftp://images.alphabroder.com/Hi-Res%20Web%20Images/"
$ftpCreds = Get-Credential

$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\AlphaBroderContent - Documents\Project Files\2020 Fashionwear Microsite.xlsx"
$throttlecount = 0;

$source = "W:\ALPHA BRODER\PNGS\"
$destination = "G:\Shared drives\SJC Alpha\Fashion Guide\IMAGES - PROCESSED\"
$ftpdestination = "G:\Shared drives\SJC Alpha\Fashion Guide\IMAGES - RAW\"
#BRAND	STYLE	SHORT DESCRIPTION	COLOR	COLOR CODE	front_image	back_image	side_image	OtherImages.1	OtherImages.2	OtherImages.3	OtherImages.4	FTP.front_image	FTP.back_image	FTP.side_image	FTP.OtherImages.1	FTP.OtherImages.2	FTP.OtherImages.3	FTP.OtherImages.4




$data = Import-Excel -Path $file -WorksheetName "SJCvsABFTP" -DataOnly

for($i = 0;$i -lt $data.Count; $i++)
{

    $r = $data[$i]
    
    $b = $r.'BRAND'
    $S = $r.'STYLE'
    $sjca = $r.'front_image'
    $sjcb = $r.'side_image'
    $sjcc = $r.'back_image'

    $ftpa = $r.'FTP.front_image'
    $ftpb = $r.'FTP.side_image'
    $ftpc = $r.'FTP.back_image'
    $i
    $s
    
    
    if($sjca)
    {
        if(-Not(Test-Path "$destination$sjca")){
            $img1 = "$source$b\$s\$sjca"
            Copy-Item "$img1" $destination
        }
    }
    elseif ($ftpa) {
        if(-Not(Test-Path "$destination$ftpa")){
            $img1 = "$RemoteFile\$ftpa"
            Invoke-WebRequest -Uri "$img1" -OutFile "$ftpdestination$ftpa" -Credential $ftpCreds
        }
    }else{
        
    }

    if($sjcb)
    {
        if(-Not(Test-Path "$destination$sjcb")){
        $img1 = "$source$b\$s\$sjcb"
        Copy-Item "$img1" $destination
        }
    }
    elseif ($ftpb) {
        if(-Not(Test-Path "$destination$ftpb")){
        $img1 = "$RemoteFile\$ftpb"
        Invoke-WebRequest -Uri "$img1" -OutFile "$ftpdestination$ftpb" -Credential $ftpCreds
        }
    }else{
        
    }

    if($sjcc)
    {
        if(-Not(Test-Path "$destination$sjcc")){
        $img1 = "$source$b\$s\$sjcc"
        Copy-Item "$img1" $destination
        }
    }
    elseif ($ftpc) {
        if(-Not(Test-Path "$destination$ftpc")){
        $img1 = "$RemoteFile\$ftpc"
        Invoke-WebRequest -Uri "$img1" -OutFile "$ftpdestination$ftpc" -Credential $ftpCreds
        }
    }{
        
    }

}