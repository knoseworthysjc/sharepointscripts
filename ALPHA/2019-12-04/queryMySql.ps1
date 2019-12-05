$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"

$conn = Connect-PnPOnline -Url $url

$my = New-Object System.Data.Odbc.OdbcConnection
$my.ConnectionString = "DSN=sjcAlphaBroderARchive"
$my.open()
$cmd = New-Object System.Data.Odbc.OdbcCommand("SELECT ``masterdataview``.``id``,
``masterdataview``.``seasons_id``,
``masterdataview``.``season``,
``masterdataview``.``projects_id``,
``masterdataview``.``project``,
``masterdataview``.``template``,
``masterdataview``.``pagefrom``,
``masterdataview``.``abstyle``,
``masterdataview``.``millstyle``,
``masterdataview``.``brand``,
``masterdataview``.``style_status``,
``masterdataview``.``short_description``,
``masterdataview``.``long_description``,
``masterdataview``.``sub_description``,
``masterdataview``.``gender``,
``masterdataview``.``garmentfit``,
``masterdataview``.``earthfriendly``,
``masterdataview``.``category``,
``masterdataview``.``subcategory``,
``masterdataview``.``icons``,
``masterdataview``.``companionladies``,
``masterdataview``.``companiontall``,
``masterdataview``.``companionyouth``,
``masterdataview``.``price``,
``masterdataview``.``sizegroup``,
``masterdataview``.``sizerange``,
``masterdataview``.``sizetocolorgroups``,
``masterdataview``.``catalog_color_group``,
``masterdataview``.``updatedon``
FROM ``sjcAlphaBroderArchive``.``masterdataview`` where ``season`` = 2019 and ``project`` = 'USA Essentails Guide'",$my)
$dsw = New-Object System.Data.DataSet
$ds = New-Object system.Data.DataSet
   (New-Object system.Data.odbc.odbcDataAdapter($cmd)).fill($ds) | out-null
$my.close()
$data = $ds.Tables[0]

for($i = 0; $i -lt $data.Rows.count; $i++)
{
    $rec = $data.Rows[$i]
    $rec.id
}