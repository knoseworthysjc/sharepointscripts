Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/
#$list = Get-PnpList -Identity Lists/Catalog Management

$data = Import-Excel -Path "Termset Taxonmony.xlsx" -WorksheetName "Campaign Navigation Hirerarchy" -DataOnly

for ($i = 10; $i -lt $data.count; $i++) {
    $rec = $data[$i];
    $tbl = @{}
    $tbl.add("Catalog Season","Site Collection AlphBroader|Campaign Navigation Hirearchy|" + $rec.season)
    $tbl.add("Catalog Project","Site Collection AlphBroader|Campaign Navigation Hirearchy|" + $rec.season + "|" + $rec.project)
    $tbl.add("Catalog Page","Site Collection AlphBroader|Campaign Navigation Hirearchy|" + $rec.season + "|" + $rec.project + "|" + $rec.pagefrom)
    Add-PnpListItem -List "Catalog Management" -Values $tbl
}