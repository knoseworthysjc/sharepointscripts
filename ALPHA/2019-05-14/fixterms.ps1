Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Taxonomy.dll"

$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
$ctx = New-Object Microsoft.SharePoint.Client.ClientContext($url)

$userid = "kevin.noseworthy@sjccontent.onmicrosoft.com"
$pwd = Read-Host -Prompt "Pwd" -AsSecureString
$creds = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($userId, $pwd)    
$ctx.credentials = $creds

$taxStore = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($ctx)  
$ctx.Load($taxStore)  
$ctx.ExecuteQuery()  

$termStores = $taxStore.TermStores.GetByName("Taxonomy_06liv5vYFeLxOQpMy8IQAw==")  
$ctx.Load($termStores)  
$ctx.ExecuteQuery()  
$termStore = $termStores[0]
  
$Groups = $termStore.Groups  
$ctx.Load($termStore)  
$ctx.Load($Groups)  
$ctx.ExecuteQuery() 

$Group = $Groups.GetByName("AlphaBroderContentTerms")  
$termSet = $Group.TermSets.GetByName("Product Management")  
$ctx.Load($termSet)  
$ctx.ExecuteQuery()  

$products = $termSet.Terms.GetByName("Products")
$ctx.Load($products)
$ctx.ExecuteQuery()
$products