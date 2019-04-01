<?php
include "vendor/autoload.php";

$url =" https://sjccontent.sharepoint.com/teams/sjc-information-systems/alphabroder";
$UserName = "kevin.noseworthy@sjccontent.onmicrosoft.com";
$Password = "Knoseworthy0808!";
$listTitle = "Products";

$authCtx = new AuthenticationContext($Url);
$authCtx->acquireTokenForUser($UserName,$Password); //authenticate

$ctx = new ClientContext($Url,$authCtx); //initialize REST client    
$web = $ctx->getWeb();
$list = $web->getLists()->getByTitle($listTitle); //init List resource
$items = $list->getItems();  //prepare a query to retrieve from the 
$ctx->load($items);  //save a query to retrieve list items from the server 
$ctx->executeQuery(); //submit query to SharePoint Online REST service
foreach( $items->getData() as $item ) {
    print "Task: '{$item->Title}'\r\n";
}

?>