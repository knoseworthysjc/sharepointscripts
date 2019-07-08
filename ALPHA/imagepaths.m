let
    Source = Csv.Document(File.Contents("C:\Users\KevinNoseworthy\Documents\GitHub\powershellsharepoint\ALPHA\assetpaths.csv"),[Delimiter="|", Columns=2, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Changed Type" = Table.TransformColumnTypes(Source,{{"Column1", type text}, {"Column2", type text}}),
    #"Promoted Headers" = Table.PromoteHeaders(#"Changed Type", [PromoteAllScalars=true]),
    #"Changed Type1" = Table.TransformColumnTypes(#"Promoted Headers",{{"Name", type text}, {"FullName", type text}}),
    #"Duplicated Column" = Table.DuplicateColumn(#"Changed Type1", "FullName", "FullName - Copy"),
    #"Replaced Value" = Table.ReplaceValue(#"Duplicated Column","\\10.3.0.39\Alpha Broder\ALPHA BRODER IMAGES\","",Replacer.ReplaceText,{"FullName - Copy"}),
    #"Split Column by Delimiter" = Table.SplitColumn(#"Replaced Value", "FullName - Copy", Splitter.SplitTextByDelimiter("\", QuoteStyle.Csv), {"FullName - Copy.1", "FullName - Copy.2"}),
    #"Changed Type2" = Table.TransformColumnTypes(#"Split Column by Delimiter",{{"FullName - Copy.1", type text}, {"FullName - Copy.2", type text}}),
    #"Added Conditional Column" = Table.AddColumn(#"Changed Type2", "Custom", each if Text.Contains([#"FullName - Copy.2"], ".") then 1 else 0),
    #"Filtered Rows" = Table.SelectRows(#"Added Conditional Column", each ([Custom] = 1)),
    #"Removed Columns" = Table.RemoveColumns(#"Filtered Rows",{"Custom"}),
    #"Added Custom" = Table.AddColumn(#"Removed Columns", "Custom", each if Text.Contains([Name],"CAT") or Text.Contains([Name],"CAN") then List.First(Text.Split([Name],"_")) else ""),
    #"Renamed Columns" = Table.RenameColumns(#"Added Custom",{{"FullName - Copy.1", "Brand"}}),
    #"Filtered Rows1" = Table.SelectRows(#"Renamed Columns", each ([Brand] <> "PRIME LINE")),
    #"Added Custom1" = Table.AddColumn(#"Filtered Rows1", "ContentType", each "styles"),
    #"Reordered Columns" = Table.ReorderColumns(#"Added Custom1",{"ContentType", "Brand", "Name", "FullName", "Custom", "FullName - Copy.2"}),
    #"Replaced Value1" = Table.ReplaceValue(#"Reordered Columns","-","_",Replacer.ReplaceText,{"FullName - Copy.2"}),
    #"Split Column by Delimiter1" = Table.SplitColumn(#"Replaced Value1", "FullName - Copy.2", Splitter.SplitTextByDelimiter("_", QuoteStyle.Csv), {"FullName - Copy.2.1", "FullName - Copy.2.2"}),
    #"Changed Type3" = Table.TransformColumnTypes(#"Split Column by Delimiter1",{{"FullName - Copy.2.1", type text}, {"FullName - Copy.2.2", type text}}),
    #"Uppercased Text" = Table.TransformColumns(#"Changed Type3",{{"FullName - Copy.2.2", Text.Upper, type text}, {"FullName - Copy.2.1", Text.Upper, type text}}),
    #"Removed Columns1" = Table.RemoveColumns(#"Uppercased Text",{"FullName - Copy.2.1"}),
    #"Reordered Columns1" = Table.ReorderColumns(#"Removed Columns1",{"ContentType", "Brand", "FullName - Copy.2.2", "FullName", "Name", "Custom"}),
    #"Trimmed Text" = Table.TransformColumns(#"Reordered Columns1",{{"Brand", Text.Trim, type text}}),
    #"Capitalized Each Word" = Table.TransformColumns(#"Trimmed Text",{{"Brand", Text.Proper, type text}}),
    #"Added Custom2" = Table.AddColumn(#"Capitalized Each Word", "Test3", each if List.Count(Text.Split(Text.Replace([Name],[Custom]&"_",""),"_")) = 2 
    then Text.Split([Name],"_"){1} 
else if Text.Contains([#"FullName - Copy.2.2"], " ") 
    then "" 
else if Text.Contains([#"FullName - Copy.2.2"], ".") 
then "" 
else if List.Count(Text.Split(Text.Replace([Name],[Custom]&"_",""),"_")) = 1
    then Text.Split([Name],"_"){1}
else [#"FullName - Copy.2.2"])
in
    #"Added Custom2"