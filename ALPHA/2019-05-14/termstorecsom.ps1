Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.dll"  
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Runtime.dll"  
Add-Type -Path "C:\Program Files\Common Files\Microsoft Shared\Web Server Extensions\16\ISAPI\Microsoft.SharePoint.Client.Taxonomy.dll"

$url = "https://sjccontent.sharepoint.com/teams/AlphaBroderContent"
$userId = "kevin.noseworthy@sjccontent.onmicrosoft.com"  
$pwd = Read-Host -Prompt "Enter password" -AsSecureString  

$creds = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($userId, $pwd)  
$context = New-Object Microsoft.SharePoint.Client.ClientContext($url)  
$context.credentials = $creds
$terms = @{}
$lists = $context.web.Lists  
$list = $lists.GetByTitle("Products") 
$context.Load($list)

$mms = [Microsoft.SharePoint.Client.Taxonomy.TaxonomySession]::GetTaxonomySession($context);
$context.Load($mms);
$context.ExecuteQuery();

$termStores = $mms.TermStores;
$context.Load($termStores);
$context.ExecuteQuery();

$termstore = $termStores[0]
$context.Load($termstore)
$context.ExecuteQuery();

$group = $termStore.Groups.GetByName("AlphaBroderContentTerms");
$context.Load($group);
$context.ExecuteQuery();

$termset = $group.TermSets.GetByName("Product Management")
$context.Load($termset)
$context.Load($termset.GetAllTerms())
$context.ExecuteQuery()

function loopTerms ($term) {
    $list = @()
    foreach ($t in $terms)
    {
     $obj = @{}
     $obj.Add("Name",$t.Name)
     $obj.Add("Id",$t.Id)   
        if($null -ne $t.Terms)
        {
            $termsa = $t.Terms
            $context.Load($termsa)
            $context.ExecuteQuery()
            $childrend = loopTerms($termsa)
            $obj.Add("Children",$childrend)
        }
    $list.Add($obj)
    }
    return $list
}

$terms = $termset.Terms
$context.Load($terms)
$context.ExecuteQuery()
$terms = loopTerms($terms)
$terms
<#
$term = $group.Terms.GetByName("DG479")
$context.Load($term)
$context.ExecuteQuery();
$term
#>
