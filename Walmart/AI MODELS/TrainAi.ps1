$url = "https://imagetraining.blob.core.windows.net/complexform?st=2020-01-27T23%3A06%3A42Z&se=2020-02-10T23%3A06%3A00Z&sp=racwdl&sv=2018-03-28&sr=c&sig=lW%2FeFtd9A4LplRgrVubA29lohMyfw%2FBLhLwfKFTXE30%3D"
$qry = "?st=2020-01-27T23%3A06%3A42Z&se=2020-02-10T23%3A06%3A00Z&sp=racwdl&sv=2018-03-28&sr=c&sig=lW%2FeFtd9A4LplRgrVubA29lohMyfw%2FBLhLwfKFTXE30%3D"


$obj = @{}
$obj.Add("source",$qry);
$x = ConvertTo-Json($obj)
$x

$cmd = curl -i -X POST "https://walmart-merchtages.cognitiveservices.azure.com/formrecognizer/v1.0-preview/custom/train" -H "Content-Type: application/json" -H "Ocp-Apim-Subscription-Key: abfe1f9623b04521a289049ccb473223" --data-ascii "$x"

$cmd


Transfer-Encoding: chunked
x-envoy-upstream-service-time: 8593
apim-request-id: 60e30e8d-7cd3-464d-a41d-5d2cfd67529c
Strict-Transport-Security: max-age=31536000; includeSubDomains; preload
x-content-type-options: nosniff
Date: Mon, 27 Jan 2020 23:32:08 GMT
Content-Type: application/json; charset=utf-8

{
  "modelId": "cb6d1e70-d7ce-4005-96ef-f63fb9fc4d59",
  "trainingDocuments": [{
    "documentName": "WIN_20191025_14_43_48_Scan.jpg",
    "pages": 1,
    "errors": [],
    "status": "success"
  }, {
    "documentName": "WIN_20191025_14_43_55_Scan.jpg",
    "pages": 1,
    "errors": [],
    "status": "success"
  }, {
    "documentName": "WIN_20191025_14_44_07_Scan.jpg",
    "pages": 1,
    "errors": [],
    "status": "success"
  }, {
    "documentName": "WIN_20191025_14_44_13_Scan.jpg",
    "pages": 1,
    "errors": [],
    "status": "success"
  }, {
    "documentName": "WIN_20191025_14_44_18_Scan.jpg",
    "pages": 1,
    "errors": [],
    "status": "success"
  }, {
    "documentName": "WIN_20191025_14_44_33_Scan.jpg",
    "pages": 1,
    "errors": [],
    "status": "success"
  }],
  "errors": []
}