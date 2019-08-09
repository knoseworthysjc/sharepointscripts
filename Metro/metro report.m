let
    Source = Excel.Workbook(Web.Contents("https://docs.google.com/spreadsheets/d/e/2PACX-1vSTPVc0SgkX0te1QfImVrF8wi0cl8y2Iume6ocWfPyVwysHWw0BFE8nUDUxc7Ke0ftucfLITxFyleHX/pub?output=xlsx"), null, true),
    #"St Joseph Items _Sheet" = Source{[Item="St Joseph Items ",Kind="Sheet"]}[Data],
    #"Filtered Rows" = Table.SelectRows(#"St Joseph Items _Sheet", each [Column1] <> #date(2019, 7, 26) and [Column1] <> "METRO STATUS REPORT"),
    #"Promoted Headers" = Table.PromoteHeaders(#"Filtered Rows", [PromoteAllScalars=true]),
    #"Removed Other Columns" = Table.SelectColumns(#"Promoted Headers",{"Brand", "Description", "Variety & Weight Statement  ", "Supplier", "Dkt  ", "CATEGORY NUMBER", "UPC Code#(lf)59749 …", "# of SKUs", "Type of Project", "COPY received                                                          ", "DIELINE / PRINT SPECS Received       ", "PACKAGE SAMPLES Received", "PRODUCT SAMPLES Received", "PROJECT START DATE#(lf)(BRIEF SENT)", "PLANNED CONCEPT#(lf) APPROVAL DATE", "CONCEPT in progress", "1st CONCEPT                                      shipped for approval", "CONCEPT                                  Comments from Metro", "2nd CONCEPT in progress", "2nd CONCEPT shipped for approval", "2nd CONCEPT                                  Comments from Metro", "3rd CONCEPT in progress", "3rd CONCEPT shipped for approval", "3rd CONCEPT                                  Comments from Metro", "4th CONCEPT in progress", "4th CONCEPT shipped for approval", "4th CONCEPT                                  Comments from Metro", "CONCEPT APPROVAL", "PHOTOGRAPHY DATE", "ARTWORK                                                           in progress", "1st PROOF SCHEDULED DATE", "ARTWORK PROOF 1                                     shipped for approval", "ARTWORK                                                                   comments Éric", "ARTWORK                                 comments from Céline", "ARTWORK                                 comments from Q&A", "ARTWORK                                 comments from Vendor", "ARTWORK                                 comments from Printer", "ARTWORK REVISIONS                                  in progress", "2nd PROOF SCHEDULED DATE", "ARTWORK PROOF 2                                   shipped for approval", "ARTWORK                                 comments from Éric", "ARTWORK                                 comments from Céline_1", "ARTWORK                                 comments from Q&A_2", "ARTWORK                                 comments from Vendor_3", "ARTWORK                                 comments from Printer_4", "Random to Watt", "Random approved", "ARTWORK REVISIONS                                  in progress_5", "3rd PROOF SCHEDULED DATE", "ARTWORK PROOF 3                                   shipped for approval", "ARTWORK                                 comments from Q&A_6", "ARTWORK                                 comments from Vendor_7", "ARTWORK                                 comments from Printer_8", "ARTWORK REVISIONS                                  in progress_9", "4th PROOF SCHEDULED DATE", "ARTWORK PROOF 4                                   shipped for approval", "ARTWORK                                 comments from Q&A_10", "ARTWORK                                 comments from Vendor_11", "ARTWORK                                 comments from Printer_12", "FINAL ARTWORK                           shipped to Film House", "CD RELEASE Scheduled Date", "CROMALIN to Watt for approval", "Film being stepped?", "Project Manager", " Progress Report REQUIRED", "Progress Report Sheet DONE", "COMMENTS", "SEL Logo REDUCTION Done"}),
    #"Changed Type" = Table.TransformColumnTypes(#"Removed Other Columns",{{"PLANNED CONCEPT#(lf) APPROVAL DATE", type text}}),
    #"Replaced Value" = Table.ReplaceValue(#"Changed Type","n/a",null,Replacer.ReplaceValue,{"PLANNED CONCEPT#(lf) APPROVAL DATE"}),
    #"Changed Type1" = Table.TransformColumnTypes(#"Replaced Value",{{"CONCEPT in progress", type text}, {"1st CONCEPT                                      shipped for approval", type text}, {"CONCEPT                                  Comments from Metro", type text}, {"2nd CONCEPT in progress", type text}, {"2nd CONCEPT shipped for approval", type text}}),
#"Removed Columns" = Table.RemoveColumns(#"Changed Type1",{"COPY received                                                          ", "DIELINE / PRINT SPECS Received       ", "PACKAGE SAMPLES Received", "PRODUCT SAMPLES Received", "PROJECT START DATE#(lf)(BRIEF SENT)", "CONCEPT in progress", "1st CONCEPT                                      shipped for approval", "CONCEPT                                  Comments from Metro", "2nd CONCEPT in progress", "2nd CONCEPT shipped for approval", "2nd CONCEPT                                  Comments from Metro", "3rd CONCEPT in progress", "3rd CONCEPT shipped for approval", "3rd CONCEPT                                  Comments from Metro", "4th CONCEPT in progress", "4th CONCEPT shipped for approval", "4th CONCEPT                                  Comments from Metro", "CONCEPT APPROVAL", "PHOTOGRAPHY DATE", "ARTWORK                                                           in progress", "ARTWORK PROOF 1                                     shipped for approval", "ARTWORK                                                                   comments Éric", "ARTWORK                                 comments from Céline", "ARTWORK                                 comments from Q&A", "ARTWORK                                 comments from Vendor", "ARTWORK                                 comments from Printer", "ARTWORK REVISIONS                                  in progress", "ARTWORK PROOF 2                                   shipped for approval", "ARTWORK                                 comments from Éric", "ARTWORK                                 comments from Céline_1", "ARTWORK                                 comments from Q&A_2", "ARTWORK                                 comments from Vendor_3", "ARTWORK                                 comments from Printer_4", "Random to Watt", "Random approved", "ARTWORK REVISIONS                                  in progress_5", "ARTWORK PROOF 3                                   shipped for approval", "ARTWORK                                 comments from Q&A_6", "ARTWORK                                 comments from Vendor_7", "ARTWORK                                 comments from Printer_8", "ARTWORK REVISIONS                                  in progress_9", "ARTWORK                                 comments from Q&A_10", "ARTWORK                                 comments from Vendor_11", "ARTWORK                                 comments from Printer_12", "FINAL ARTWORK                           shipped to Film House", "CD RELEASE Scheduled Date", "CROMALIN to Watt for approval", "Film being stepped?", "Project Manager", " Progress Report REQUIRED", "Progress Report Sheet DONE", "COMMENTS", "SEL Logo REDUCTION Done"}),
    #"Removed Columns1" = Table.RemoveColumns(#"Removed Columns",{"ARTWORK PROOF 4                                   shipped for approval"}),
    #"Changed Type2" = Table.TransformColumnTypes(#"Removed Columns1",{{"1st PROOF SCHEDULED DATE", type date}, {"2nd PROOF SCHEDULED DATE", type date}, {"3rd PROOF SCHEDULED DATE", type date}, {"4th PROOF SCHEDULED DATE", type date}}),
    
#"Added Conditional Column" = Table.AddColumn(#"Changed Type2", "Late", each 
if [#"PLANNED CONCEPT#(lf) APPROVAL DATE"] = null then "No" 
else 
if Date.IsInPreviousNDays([#"PLANNED CONCEPT#(lf) APPROVAL DATE"], 8) then "Yes|Planned Concept" 
else 
if Date.IsInPreviousNDays([#"1st PROOF SCHEDULED DATE"], 8) then "Yes|1st Proof"
else 
if Date.IsInPreviousNDays([#"2nd PROOF SCHEDULED DATE"], 8) then "Yes|2nd Proof"
else 
if Date.IsInPreviousNDays([#"3rd PROOF SCHEDULED DATE"], 8) then "Yes|3rd Proof"
else 
if Date.IsInPreviousNDays([#"4th PROOF SCHEDULED DATE"], 8) then "Yes|4th Proof" 
else "No"),
#"Added Conditional Column1" = Table.AddColumn(#"Added Conditional Column", "Today", each if [#"PLANNED CONCEPT#(lf) APPROVAL DATE"] = null then "No" 
else if Date.IsInCurrentDay([#"PLANNED CONCEPT#(lf) APPROVAL DATE"]) then "Yes|Planned Concept" 
else if Date.IsInCurrentDay([#"1st PROOF SCHEDULED DATE"]) then "Yes|1st Proof"
else if Date.IsInCurrentDay([#"2nd PROOF SCHEDULED DATE"]) then "Yes|2nd Proof"
else if Date.IsInCurrentDay([#"3rd PROOF SCHEDULED DATE"]) then "Yes|3rd Proof"
else if Date.IsInCurrentDay([#"4th PROOF SCHEDULED DATE"]) then "Yes|4th Proof" 
else "No"),
#"Added Conditional Column2" = Table.AddColumn(#"Added Conditional Column1", "Due With 1 week", each 
if [#"PLANNED CONCEPT#(lf) APPROVAL DATE"] = null then "No" 
else 
if Date.IsInNextNDays([#"PLANNED CONCEPT#(lf) APPROVAL DATE"], 8) then "Yes|Planned Concept" 
else 
if Date.IsInNextNDays([#"1st PROOF SCHEDULED DATE"], 8) then "Yes|1st Proof"
else 
if Date.IsInNextNDays([#"2nd PROOF SCHEDULED DATE"], 8) then "Yes|2nd Proof"
else 
if Date.IsInNextNDays([#"3rd PROOF SCHEDULED DATE"], 8) then "Yes|3rd Proof"
else 
if Date.IsInNextNDays([#"4th PROOF SCHEDULED DATE"], 8) then "Yes|4th Proof" 
else "No")
in
    #"Added Conditional Column2"