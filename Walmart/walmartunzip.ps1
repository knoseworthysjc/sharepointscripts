#\\10.136.209.164\shehala1\todo
#\\10.136.209.199\Image_Incoming\Work In Progress\DAM DropBox
Add-Type -AssemblyName System.IO.Compression.FileSystem
$testing = 1

if($testing){
    $in = "C:\Users\KevinNoseworthy\OneDrive - St Joseph Communications, Content Group\Desktop\TestZip\In\"
    $tmp = "C:\Users\KevinNoseworthy\OneDrive - St Joseph Communications, Content Group\Desktop\TestZip\tmp\"
    $out = "C:\Users\KevinNoseworthy\OneDrive - St Joseph Communications, Content Group\Desktop\TestZip\Out\"
}else{
    $in = "Z:\=Downloaded\"
    $tmp = "Y:\Work In Progress\DAM DropBox\tmp\"
    $out = "Y:\Work In Progress\DAM DropBox\extractedtif\"
}


$Filter = '*.tif'

$zipfiles = Get-ChildItem -Path $in -Filter *.zip 
For($i=0; $i -lt $zipfiles.Count; $i++)
{   
    try {
        #Expand-Archive -Path $zipfiles[$i].FullName -DestinationPath $tmp
        #Move-Item $zipfiles[$i].Fullname -Destination $tmp
        Move-Item $zipfiles[$i].Fullname -Destination $tmp -Force
        $file = $tmp + $zipfiles[$i].Name

        $zip = [System.IO.Compression.ZipFile]::OpenRead($file)

                # find all files in ZIP that match the filter (i.e. file extension)
                $zip.Entries | 
                Where-Object { $_.FullName -like $Filter } |
                ForEach-Object { 
                    # extract the selected items from the ZIP archive
                    # and copy them to the out folder
                    $FileName = $_.Name
                    [System.IO.Compression.ZipFileExtensions]::ExtractToFile($_, "$out\$FileName", $true)
                    }

                # close ZIP file
                $zip.Dispose()


    } catch {

    }
}