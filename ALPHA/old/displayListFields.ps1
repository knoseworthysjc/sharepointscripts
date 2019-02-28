Connect-PnPOnline -Url https://sjccontent.sharepoint.com/teams/SJCAlphaBroderContentAdmin/
$list = Get-PnpList -Identity "Lists/AB Styles"
$f = Get-PnpField -List $list
for ($i = 0; $i -lt $f.Count; $i++) {
    $f[$i].InternalName;
}
