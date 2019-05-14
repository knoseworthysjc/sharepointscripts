$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"

Connect-PnPOnline -Url $url

$file = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\WalmartContent - Documents\Walmart DAMG Editor.xlsm"
$data = Import-Excel -Path $file -WorksheetName "Image Lookup" -DataOnly

for($z = 2070; $z -lt $data.length; $z++) 
{ 

    $rec = $data[$z]

    $rord = @{}
    $a = $rec.FileID
    $b = $rec.Item_Number
    $c = $rec.FileName
    $d = $rec.FilePath
    $e =$rec.Keywords
    $f = $rec.UPC
    $g = $rec.CreateDate
    $h = $rec.ModifiedDate
    $i = $rec.AccessedDate
    $j = $rec.Categories
    $k = $rec.XinetPreview

    $rord.Add("fileid",$a)
    $rord.Add("itemnumber",$b)
    $rord.Add("filename",$c)
    $rord.Add("filepath",$d)
    $rord.Add("keywords",$e)
    $rord.Add("upc",$f)
    $rord.Add("createdate",$g)
    $rord.Add("modifieddate",$h)
    $rord.Add("accesseddate",$i)
    $rord.Add("productcategories",$j)
    $rord.Add("XinetPreview",$k)
    
    $a
    
    try {
        Add-PnpListItem -List "XinetAssets" -Values $rord -ContentType "XinetImages" -ErrorAction Continue
    }
    catch {

    }
    
}
