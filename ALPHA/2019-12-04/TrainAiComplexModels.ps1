curl -i -X POST "https://walmart-merchtages.cognitiveservices.azure.com/formrecognizer/v1.0-preview/custom/train" -H "Content-Type: application/json" -H "Ocp-Apim-Subscription-Key: abfe1f9623b04521a289049ccb473223" --data-ascii "{\"source\":\""}"

$body = @{}
$body.Add("source","https://imagetraining.blob.core.windows.net/advancedimages/")
$headers = @{}
$headers.Add("Content-Type","application/json")
$headers.Add("Ocp-Apim-Subscription-Key","abfe1f9623b04521a289049ccb473223")
$data = Invoke-WebRequest -Method "Post" -Uri "https://walmart-merchtages.cognitiveservices.azure.com/formrecognizer/v1.0-preview/custom/train" -Headers $headers -Body $body


$source = @{source="https://imagetraining.blob.core.windows.net/advancedimages?st=2020-01-27T20%3A08%3A37Z`"&se=2020-01-28T20%3A08%3A37Z&sp=rl&sv=2018-03-28&sr=c&sig=87oKpK8HbizGtD%2BsdSakwHsjx%2F7DHkaOBKCbwkr9sh8%3D"}

curl -i -X POST "https://walmart-merchtages.cognitiveservices.azure.com/formrecognizer/v1.0-preview/custom/train" -H "Content-Type: application/json" -H "Ocp-Apim-Subscription-Key: abfe1f9623b04521a289049ccb473223" --data-ascii "{\"source\":\"https://imagetraining.blob.core.windows.net/advancedimages"}"
