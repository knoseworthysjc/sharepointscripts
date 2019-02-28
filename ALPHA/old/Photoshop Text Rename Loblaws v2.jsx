try{
var textFile = File.openDialog ("Open Data Excel Sheet", "*.txt,*.csv",false);
var imageDir = Folder.selectDialog("Select Source Directory");
var destinationDir = Folder.selectDialog("Select Destination");

var line = 0;
var articleColumn = 0;
var upcColumn= 1;
var upcColumnb = 2;
var filetype = "*.jpg";
var upctoart = [];
if(textFile != null && imageDir != null && destinationDir != null){
textFile.open('r');
while(!textFile.eof)
{
var row = textFile.readln();    
var cols = row.split("\t");

upctoart[cols[upcColumn]]=cols[articleColumn];
upctoart[cols[upcColumnb]]=cols[articleColumn];

line++;
}
textFile.close();
alert("Text:" + upctoart.length);
var files = imageDir.getFiles(filetype);
alert("Files:" + files.length);
for(var i = 0; i < files.length; i++)
{
//alert (files[i].fullName);
var f = files[i];
var fileName = f.name;
var fs = fileName.split("_");
alert(fs);
if(typeof upctoart[fs[0]] == 'undefined')
{
continue;    
    }
var artNum = upctoart[fs[0]];

var destinationFileName = fileName.replace(fs[0],artNum);
try{
    var file = new File(destinationDir.fullName + '/' + destinationFileName);
    if(!file.exists){
        f.copy(destinationDir.fullName + '/' + destinationFileName);
        f.remove();
}
}catch(err){
    alert(err.message);
}
}
}
alert('Done');}

catch(err){
    alert(err.message);
}