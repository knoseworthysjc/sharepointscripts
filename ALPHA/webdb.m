let
    ClientData = Excel.CurrentWorkbook(){[Name="ClientData"]}[Content],
    #"Removed Columns1" = Table.RemoveColumns(ClientData,{"Page", "Website", "DESCRIPTION", "REVENUE TTM", "Sort "}),
    #"Renamed Columns6" = Table.RenameColumns(#"Removed Columns1",{{"Brand", "BrandName"}}),
    #"Uppercased Text" = Table.TransformColumns(#"Renamed Columns6",{{"STYLE ", Text.Upper, type text}}),
    #"Trimmed Text" = Table.TransformColumns(#"Uppercased Text",{{"STYLE ", Text.Trim, type text}}),
    #"Filtered Rows1" = Table.SelectRows(#"Trimmed Text", each ([#"STYLE "] <> "STYLE")),
    Styles = "'"&Text.Combine(Table.Column(#"Filtered Rows1","STYLE "),"','")&"'",
    Source = Odbc.Query("dsn=sjcAlphaBroderArchive", "select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where 
`projects_id` = 59 and `abstyle` in("&Styles&") and `brand` <> '1delete'
union
select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where 
`projects_id` = 4 and `abstyle` in("&Styles&") and `updatedon` > '2019-03-01' 
and `abstyle` not in (select `abstyle` from `offers` where `projects_id` = 59)
and `brand` <> '1delete' 
union
select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where 
`projects_id` = 56 and `abstyle` in("&Styles&")
and `abstyle` not in (select `abstyle` from `offers` where `projects_id` = 59)
and `abstyle` not in (select `abstyle` from `offers` where `projects_id` = 4 and `updatedon` > '2019-03-01')
and `brand` <> '1delete'
union
select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where 
`projects_id` = 52 and `abstyle` in("&Styles&")
and `abstyle` not in (select `abstyle` from `offers` where `projects_id` = 59 or `projects_id` = 56)
and `abstyle` not in (select `abstyle` from `offers` where `projects_id` = 4 and `updatedon` > '2019-03-01')
and `brand` <> '1delete'
union
select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where 
`projects_id` = 45 and `abstyle` in("&Styles&")
and `abstyle` not in (select `abstyle` from `offers` where `projects_id` = 59 or `projects_id` = 56 or `projects_id` = 52)
and `abstyle` not in (select `abstyle` from `offers` where `projects_id` = 4 and `updatedon` > '2019-03-01')
and `brand` <> '1delete'
union
select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where `projects_id` = 62
;"),
    #"Replaced Value6" = Table.ReplaceValue(Source,"#(cr)#(lf)"," ",Replacer.ReplaceText,{"short_description"}),
    #"Replaced Value7" = Table.ReplaceValue(#"Replaced Value6","#(cr)"," ",Replacer.ReplaceText,{"short_description"}),
    #"Replaced Value8" = Table.ReplaceValue(#"Replaced Value7","#(lf)"," ",Replacer.ReplaceText,{"short_description"}),
    Garmentfitnulls = Table.ReplaceValue(#"Replaced Value8","null",null,Replacer.ReplaceValue,{"garmentfit"}),
    #"Replaced Value3" = Table.ReplaceValue(Garmentfitnulls,"#(cr)#(lf)","",Replacer.ReplaceText,{"attributes"}),
    #"Replaced Value4" = Table.ReplaceValue(#"Replaced Value3","#(cr)"," ",Replacer.ReplaceText,{"attributes"}),
    #"Replaced Value5" = Table.ReplaceValue(#"Replaced Value4","#(lf)"," ",Replacer.ReplaceText,{"attributes"}),
TBL = Table.Join(#"Filtered Rows1","STYLE ", #"Replaced Value5", "abstyle", JoinKind.LeftOuter),
    #"Changed Type" = Table.TransformColumnTypes(TBL,{{"MSRP", type text}}),
    #"Replaced Errors" = Table.ReplaceErrorValues(#"Changed Type", {{"MSRP", ""}}),
    #"Filtered Rows" = Table.SelectRows(#"Replaced Errors", each ([#"STYLE "] <> "STYLE ")),
    #"Reordered Columns" = Table.ReorderColumns(#"Filtered Rows",{"STYLE ", "brand", "OUTERWEAR CATEGORY", "Also Available", "NEW", "Status", "PRIMEPLUS PRIME", "MSRP Code", "MSRP", "Best Better Good", "Gender", "assortmentsheetdata", "abstyle", "short_description", "attributes", "gender", "garmentfit", "icons", "companionladies", "companiontall", "companionyouth", "sizegroup", "sizerange", "catalog_color_group"}),
    #"Renamed Columns" = Table.RenameColumns(#"Reordered Columns",{{"OUTERWEAR CATEGORY", "category"}}),
    #"Removed Columns" = Table.RemoveColumns(#"Renamed Columns",{"abstyle"}),
    #"Reordered Columns1" = Table.ReorderColumns(#"Removed Columns",{"STYLE ", "brand", "category", "short_description", "Also Available", "NEW", "Status", "PRIMEPLUS PRIME", "MSRP Code", "MSRP", "Best Better Good", "Gender", "assortmentsheetdata", "attributes", "gender", "garmentfit", "icons", "companionladies", "companiontall", "companionyouth", "sizegroup", "sizerange", "catalog_color_group"}),
    #"Removed Columns2" = Table.RemoveColumns(#"Reordered Columns1",{"assortmentsheetdata"}),
    #"Reordered Columns2" = Table.ReorderColumns(#"Removed Columns2",{"STYLE ", "brand", "category", "short_description", "attributes", "Gender", "Also Available", "NEW", "Status", "PRIMEPLUS PRIME", "MSRP Code", "MSRP", "Best Better Good", "gender", "garmentfit", "icons", "companionladies", "companiontall", "companionyouth", "sizegroup", "sizerange", "catalog_color_group"}),
    #"Removed Columns3" = Table.RemoveColumns(#"Reordered Columns2",{"gender"}),
    #"Renamed Columns1" = Table.RenameColumns(#"Removed Columns3",{{"Gender", "gender"}}),
    #"Reordered Columns3" = Table.ReorderColumns(#"Renamed Columns1",{"STYLE ", "brand", "category", "short_description", "attributes", "gender", "icons", "Also Available", "NEW", "Status", "PRIMEPLUS PRIME", "MSRP Code", "MSRP", "Best Better Good", "companionladies", "companiontall", "companionyouth", "sizegroup", "sizerange", "catalog_color_group"}),
    #"Removed Columns4" = Table.RemoveColumns(#"Reordered Columns3",{"Status"}),
    #"Reordered Columns4" = Table.ReorderColumns(#"Removed Columns4",{"STYLE ", "brand", "category", "short_description", "attributes", "gender", "icons", "Also Available", "companionladies", "companiontall", "companionyouth", "sizegroup", "NEW", "PRIMEPLUS PRIME", "MSRP Code", "MSRP", "Best Better Good", "sizerange", "catalog_color_group"}),
    #"Renamed Columns2" = Table.RenameColumns(#"Reordered Columns4",{{"PRIMEPLUS PRIME", "tier"}}),
    #"Reordered Columns5" = Table.ReorderColumns(#"Renamed Columns2",{"STYLE ", "brand", "category", "short_description", "attributes", "gender", "icons", "Also Available", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "NEW", "MSRP Code", "MSRP", "Best Better Good", "sizerange", "catalog_color_group"}),
    #"Renamed Columns3" = Table.RenameColumns(#"Reordered Columns5",{{"MSRP", "msrp"}}),
    #"Reordered Columns6" = Table.ReorderColumns(#"Renamed Columns3",{"STYLE ", "brand", "category", "short_description", "attributes", "gender", "icons", "Also Available", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "msrp", "NEW", "MSRP Code", "Best Better Good", "sizerange", "catalog_color_group"}),
    #"Renamed Columns4" = Table.RenameColumns(#"Reordered Columns6",{{"MSRP Code", "msrpcode"}}),
    #"Reordered Columns7" = Table.ReorderColumns(#"Renamed Columns4",{"STYLE ", "brand", "category", "short_description", "attributes", "gender", "icons", "Also Available", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "msrp", "msrpcode", "NEW", "Best Better Good", "sizerange", "catalog_color_group"}),
    #"Renamed Columns5" = Table.RenameColumns(#"Reordered Columns7",{{"tier", "primeplus"}, {"Best Better Good", "tier"}}),
    #"Reordered Columns8" = Table.ReorderColumns(#"Renamed Columns5",{"STYLE ", "brand", "category", "short_description", "attributes", "gender", "icons", "Also Available", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "msrp", "msrpcode", "primeplus", "NEW", "sizerange", "catalog_color_group"}),
    #"Removed Columns5" = Table.RemoveColumns(#"Reordered Columns8",{"sizerange"}),
    #"Sorted Rows" = Table.Sort(#"Removed Columns5",{{"brand", Order.Ascending}, {"STYLE ", Order.Ascending}}),
#"Added Custom1" = Table.AddColumn(#"Sorted Rows", "AttributeList", each Table.SelectRows(Table.TransformColumns(Table.AddColumn(Table.FromList(Text.Split([attributes],"•"), Splitter.SplitByNothing(),null,null,ExtraValues.List),"FeatureFabric",each 
if Text.Contains([Column1],"oz.") then 
"Fabric" else if Text.Contains([Column1],"%") then "Fabric" 
else "Feature"
),{"Column1",Text.Trim, type text}), each [Column1] <> null and [Column1] <> "null" and [Column1] <> "")),
    features = Table.AddColumn(#"Added Custom1", "Features", each Text.Combine(List.RemoveNulls(Table.Column(Table.SelectRows([AttributeList], each [FeatureFabric] = "Feature" and [Column1] <> "" and [Column1] <> null),"Column1")),"|")),
    #"Replaced Errors4" = Table.ReplaceErrorValues(features, {{"Features", ""}}),
    #"Added Custom3" = Table.AddColumn(#"Replaced Errors4", "Fabric", each Text.Combine(List.RemoveNulls(Table.Column(Table.SelectRows([AttributeList], each [FeatureFabric] = "Fabric" and [Column1] <> ""),"Column1")),"|")),
    #"Replaced Errors1" = Table.ReplaceErrorValues(#"Added Custom3", {{"AttributeList", ""}}),
    #"Replaced Errors2" = Table.ReplaceErrorValues(#"Replaced Errors1", {{"Features", ""}}),
    #"Replaced Errors3" = Table.ReplaceErrorValues(#"Replaced Errors2", {{"Fabric", ""}}),
    #"Removed Columns6" = Table.RemoveColumns(#"Replaced Errors3",{"AttributeList"}),
    #"Reordered Columns9" = Table.ReorderColumns(#"Removed Columns6",{"STYLE ", "brand", "category", "short_description", "Features", "Fabric", "attributes", "gender", "icons", "Also Available", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "msrp", "msrpcode", "primeplus", "NEW", "catalog_color_group"}),
    #"Removed Columns7" = Table.RemoveColumns(#"Reordered Columns9",{"attributes"}),
    #"Added Custom" = Table.AddColumn(#"Removed Columns7", "companionmens", each ""),
MetaData = Excel.CurrentWorkbook(){[Name="MetaData"]}[Content],
    #"Added Conditional Column" = Table.AddColumn(MetaData, "Custom", each if Text.Contains([Path], "Styles") then 1 else 0),
    #"Filtered Rows2" = Table.SelectRows(#"Added Conditional Column", each ([Custom] = 1)),
    #"Sorted Rows1" = Table.Sort(#"Filtered Rows2",{{"Title", Order.Ascending}}),    
#"Reordered Columns10" = Table.ReorderColumns(#"Added Custom",{"STYLE ", "brand", "category", "short_description", "Features", "Fabric", "gender", "icons", "Also Available", "companionmens", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "msrp", "msrpcode", "primeplus", "NEW", "catalog_color_group"}),
RESULTS = Table.Join(#"Reordered Columns10","STYLE ",Images,"abstyle",JoinKind.LeftOuter),
    #"Renamed Columns7" = Table.RenameColumns(RESULTS,{{"brand", "Brands"}}),
    #"Added Custom2" = Table.AddColumn(#"Renamed Columns7", "brand", each if [Brands] = null then [BrandName] else [Brands]),
    #"Reordered Columns11" = Table.ReorderColumns(#"Added Custom2",{"brand", "BrandName", "STYLE ", "Brands", "category", "short_description", "Features", "Fabric", "gender", "icons", "Also Available", "companionmens", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "msrp", "msrpcode", "primeplus", "NEW", "catalog_color_group", "abstyle", "records", "RecordFromTable"}),
    #"Removed Columns8" = Table.RemoveColumns(#"Reordered Columns11",{"BrandName", "Brands"}),
    #"Renamed Columns8" = Table.RenameColumns(#"Removed Columns8",{{"STYLE ", "style"}}),
    #"Added Custom4" = Table.AddColumn(#"Renamed Columns8", "iconsnew", each if [icons] = "null" then null else [icons]),
    #"Reordered Columns12" = Table.ReorderColumns(#"Added Custom4",{"brand", "style", "category", "short_description", "Features", "Fabric", "gender", "icons", "iconsnew", "Also Available", "companionmens", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "msrp", "msrpcode", "primeplus", "NEW", "catalog_color_group", "abstyle", "records", "RecordFromTable"}),
    #"Removed Columns9" = Table.RemoveColumns(#"Reordered Columns12",{"icons"}),
    #"Renamed Columns9" = Table.RenameColumns(#"Removed Columns9",{{"iconsnew", "icons"}}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Renamed Columns9",{{"companionmens", type text}, {"companionladies", type text}, {"companiontall", type text}, {"companionyouth", type text}}),
    #"Replaced Value" = Table.ReplaceValue(#"Changed Type1","",null,Replacer.ReplaceValue,{"companionmens", "companionladies", "companiontall", "companionyouth"}),
    #"Removed Columns10" = Table.RemoveColumns(#"Replaced Value",{"records", "RecordFromTable"}),
    #"Uppercased Text1" = Table.TransformColumns(#"Removed Columns10",{{"sizegroup", Text.Upper, type text}, {"icons", Text.Upper, type text}}),
    #"Sorted Rows2" = Table.Sort(#"Uppercased Text1",{{"brand", Order.Ascending}, {"category", Order.Ascending}, {"style", Order.Ascending}})
in
    #"Sorted Rows2"