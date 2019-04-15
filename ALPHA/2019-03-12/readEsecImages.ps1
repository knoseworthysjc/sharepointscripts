$dir = "\\10.3.0.39\Alpha Broder Web Images\ESEC_Hollows\"
Get-ChildItem $dir -Filter *.jpg -Recurse | 
ForEach-Object {
    $_.FullName | Add-Content "imageList-2019-04-02.txt"
}