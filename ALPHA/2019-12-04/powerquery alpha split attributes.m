let
    QryA = Text.Combine({"select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where `season`='2019' and `project` like '%CDN Buyers Guide%' and `abstyle` in ('",Text.Combine(Table.Column(Excel.CurrentWorkbook(){[Name="Requested"]}[Content],"abstyle"),"','"),"')"}),     
    Source = Odbc.Query("dsn=sjcAlphaBroderArchive", "select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where `season`='2019' and `project` like '%CDN Buyers Guide%' and `abstyle` in ('TT11','TT11H','TT11L','TT10','TT21','TT20','TT22','TT24','TT31','TT44','TT94','TT90','TT92','TT78','TT41','TT11M','TT11SH','TT40','TT51','TT26','TT38','TT30','TT32','TT34','TT80','TT36','TT84','TT86','TT74','TT76','TT11W','TT11HW','TT11WL','TT10W','TT51W','TT21W','TT20W','TT22W','TT24W','TT32W','TT34W','TT44W','TT94W','TT90W','TT41W','TT11WRC','TT11SHW','TT40W','TT31W','TT26W','TT38W','TT30W','TT92W','TT78W','TT80W','TT70','TT86W','TT74W','TT76W','TT51Y','TT11SHY','TT31Y','TT30Y','TT90Y','ATB100','ATB101','ATB102','TT72','TT11Y','TT11HY','TT11YL','TT41Y','TT80Y','TT112','TT104','TT102','TT88Y','TT88','TT82W','TT82','TT73Y','TT73','TT72Y','TT46','TT42W','TT42','TT31HY','TT31HW','TT31H','TT12','TT108','H000','G800B','G800','G46S','G460L','G460B','G460','G185B','G185','G180','TT14','TT14W','TT12W')
union
select `assortmentsheetdata`, `abstyle`,`brand`,`short_description`,CONCAT(REPLACE(`masterdataview`.`long_description`,'• ','• '),'\n',REPLACE(`masterdataview`.`sub_description`,'• ','• ')) as 'attributes',`gender`,`garmentfit`,`icons`,`companionladies`,`companiontall`,`companionyouth`,`sizegroup`,`sizerange`,`catalog_color_group` 
from `sjcAlphaBroderArchive`.`masterdataview` where 
`abstyle` not in (select `abstyle` from `sjcAlphaBroderArchive`.`masterdataview` where `season`='2019' and `project` like '%CDN Buyers Guide%') and 
`season`='2018' and `project` like '%CDN Buyers Guide%' and `abstyle` in ('TT11','TT11H','TT11L','TT10','TT21','TT20','TT22','TT24','TT31','TT44','TT94','TT90','TT92','TT78','TT41','TT11M','TT11SH','TT40','TT51','TT26','TT38','TT30','TT32','TT34','TT80','TT36','TT84','TT86','TT74','TT76','TT11W','TT11HW','TT11WL','TT10W','TT51W','TT21W','TT20W','TT22W','TT24W','TT32W','TT34W','TT44W','TT94W','TT90W','TT41W','TT11WRC','TT11SHW','TT40W','TT31W','TT26W','TT38W','TT30W','TT92W','TT78W','TT80W','TT70','TT86W','TT74W','TT76W','TT51Y','TT11SHY','TT31Y','TT30Y','TT90Y','ATB100','ATB101','ATB102','TT72','TT11Y','TT11HY','TT11YL','TT41Y','TT80Y','TT112','TT104','TT102','TT88Y','TT88','TT82W','TT82','TT73Y','TT73','TT72Y','TT46','TT42W','TT42','TT31HY','TT31HW','TT31H','TT12','TT108','H000','G800B','G800','G46S','G460L','G460B','G460','G185B','G185','G180','TT14','TT14W','TT12W')"),
    clienthandoff = Excel.CurrentWorkbook(){[Name="ClientHandoff"]}[Content],
    #"Grouped Rows" = Table.Group(clienthandoff, {"style number"}, {{"Count", each _, type table [style number=text, color name=text, color code=anynonnull, style_code=text, color category=text, hexcode=text, Column1=text, tier=text, msrp=anynonnull, msrp code=text, #"primeplus /prime"=text, new=text, brand=text, product category=text, Column3=text]}}),
    #"Added Custom4" = Table.AddColumn(#"Grouped Rows", "tier", each List.First(List.RemoveNulls(List.Distinct(Table.Column([Count],"tier"))))),
    #"Added Custom5" = Table.AddColumn(#"Added Custom4", "msrp", each List.First(List.RemoveNulls(List.Distinct(Table.Column([Count],"msrp"))))),
    #"Added Custom6" = Table.AddColumn(#"Added Custom5", "primeplue", each List.First(List.RemoveNulls(List.Distinct(Table.Column([Count],"primeplus /prime"))))),
    #"Added Custom7" = Table.AddColumn(#"Added Custom6", "new", each List.First(List.RemoveNulls(List.Distinct(Table.Column([Count],"new"))))),
    #"Added Custom8" = Table.AddColumn(#"Added Custom7", "product category", each List.First(List.RemoveNulls(List.Distinct(Table.Column([Count],"product category"))))),
    #"Added Custom9" = Table.AddColumn(#"Added Custom8", "msrpcode", each List.First(List.RemoveNulls(List.Distinct(Table.Column([Count],"msrp code"))))),
    clientdata = Table.AddColumn(#"Added Custom9", "companions", each List.First(List.RemoveNulls(List.Distinct(Table.Column([Count],"Column3"))))),
    #"Added Custom" = Table.AddColumn(Source, "assortmentsheet", each Json.Document(Text.FromBinary([assortmentsheetdata]))),
    #"Reordered Columns" = Table.ReorderColumns(#"Added Custom",{"abstyle", "brand", "attributes", "short_description", "gender", "garmentfit", "icons", "companionladies", "companiontall", "companionyouth", "sizegroup", "sizerange", "catalog_color_group", "assortmentsheetdata", "assortmentsheet"}),
    #"Removed Columns" = Table.RemoveColumns(#"Reordered Columns",{"assortmentsheetdata"}),
    #"Replaced Errors" = Table.ReplaceErrorValues(#"Removed Columns", {{"assortmentsheet", ""}}),
    #"Replaced Value" = Table.ReplaceValue(#"Replaced Errors","#(cr)#(lf)","",Replacer.ReplaceText,{"attributes"}),
    #"Replaced Value54" = Table.ReplaceValue(#"Replaced Value","#(lf)"," ",Replacer.ReplaceText,{"attributes"}),
    #"Replaced Value55" = Table.ReplaceValue(#"Replaced Value54","#(cr)"," ",Replacer.ReplaceText,{"attributes"}),
    #"Replaced Value56" = Table.ReplaceValue(#"Replaced Value55","#(00A0)"," ",Replacer.ReplaceText,{"attributes"}),
    #"Trimmed Text" = Table.TransformColumns(#"Replaced Value56",{{"attributes", Text.Trim, type text}}),
    #"Added Custom1" = Table.AddColumn(#"Trimmed Text", "AttributeList", each Table.TransformColumns(Table.AddColumn(Table.FromList(Text.Split([attributes],"•"), Splitter.SplitByNothing(),null,null,ExtraValues.List),"FeatureFabric",each 
if Text.Contains([Column1],"oz.") then 
"Fabric" else if Text.Contains([Column1],"%") then "Fabric" 
else "Feature"
),{"Column1",Text.Trim, type text})),
    features = Table.AddColumn(#"Added Custom1", "Features", each Text.Combine(Table.Column(Table.SelectRows([AttributeList], each [FeatureFabric] = "Feature" and [Column1] <> ""),"Column1"),"|")),
    #"Added Custom3" = Table.AddColumn(features, "Fabric", each Text.Combine(Table.Column(Table.SelectRows([AttributeList], each [FeatureFabric] = "Fabric" and [Column1] <> ""),"Column1"),"|")),
    #"Reordered Columns1" = Table.ReorderColumns(#"Added Custom3",{"abstyle", "brand", "attributes", "short_description", "Features", "Fabric", "gender", "garmentfit", "icons", "companionladies", "companiontall", "companionyouth", "sizegroup", "sizerange", "catalog_color_group", "assortmentsheet", "AttributeList"}),
    #"Removed Columns1" = Table.RemoveColumns(#"Reordered Columns1",{"attributes", "assortmentsheet", "AttributeList"}),
    #"Added Custom2" = Table.AddColumn(#"Removed Columns1", "companionmens", each ""),
    #"Reordered Columns2" = Table.ReorderColumns(#"Added Custom2",{"abstyle", "brand", "short_description", "Features", "Fabric", "gender", "garmentfit", "icons", "companionmens", "companionladies", "companiontall", "companionyouth", "sizegroup", "sizerange", "catalog_color_group"}),
    #"TBL" = Table.Join(#"Reordered Columns2", "abstyle",clientdata,"style number", JoinKind.LeftOuter),
    #"Removed Columns2" = Table.RemoveColumns(TBL,{"Count", "style number"}),
    #"Renamed Columns" = Table.RenameColumns(#"Removed Columns2",{{"product category", "category"}}),
    #"Reordered Columns3" = Table.ReorderColumns(#"Renamed Columns",{"abstyle", "brand", "category", "short_description", "Fabric", "Features", "gender", "garmentfit", "icons", "companionmens", "companionladies", "companiontall", "companionyouth", "sizegroup", "sizerange", "catalog_color_group", "tier", "msrp", "primeplue", "new", "companions"}),
    #"Removed Columns3" = Table.RemoveColumns(#"Reordered Columns3",{"sizerange"}),
    #"Reordered Columns4" = Table.ReorderColumns(#"Removed Columns3",{"abstyle", "brand", "category", "short_description", "Fabric", "Features", "gender", "garmentfit", "icons", "companionmens", "companionladies", "companiontall", "companionyouth", "sizegroup", "tier", "msrp", "msrpcode", "primeplue", "new", "companions", "catalog_color_group"}),
    #"Replaced Value1" = Table.ReplaceValue(#"Reordered Columns4","|","|#(cr)#(lf)",Replacer.ReplaceText,{"Fabric"}),
    #"Replaced Value2" = Table.ReplaceValue(#"Replaced Value1","|","|#(cr)#(lf)",Replacer.ReplaceText,{"Features"})
in
    #"Replaced Value2"