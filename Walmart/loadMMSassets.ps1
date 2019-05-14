$url = "https://sjccontent.sharepoint.com/teams/walmartcontent/"
Connect-PnPOnline -Url $url

$dir = "C:\Users\KevinNoseworthy\St Joseph Communications, Content Group\WalmartContent - Project Assets"
$files = Get-ChildItem $dir -Force -Filter "*.xlsx"

foreach($f in $files)
{
    $name = $f.Name.split("_");
    
    $campaign = $name[0]
    $year = $name[1]

    $year
    $campaign

    $file = Import-Excel -Path $f.fullName -WorksheetName "Print Media" -DataOnly
    foreach($row in $file)
    { 
        $rec = @{}
        $row
      $preview=$row.Preview
      $featured_item_number=$row."Featured Item Number" -replace "'", "\'"
      $country_of_origin=$row."Country of Origin" -replace "'", "\'"
      $grade=$row.Grade -replace "'", "\'"
      $item_name=$row."Item Name" -replace "'", "\'"
      $copy_description=$row."Copy Description" -replace "'", "\'"
      $ad_block_theme=$row."Ad Block Theme" -replace "'", "\'"
      $sbu=$row.SBU -replace "'", "\'"
      $portfolio_name=$row."Portfolio Name" -replace "'", "\'"
      $category_name=$row."Category Name" -replace "'", "\'"
      $item_count=$row."Item Count" -replace "'", "\'"
      $page=$row."Page" -replace "'", "\'"
      $adblock=$row."Adblock #" -replace "'", "\'"
      $version=$row."Version" -replace "'", "\'"
      $markets=$row."Markets" -replace "'", "\'"
      $grid=$row."Grid #" -replace "'", "\'"
      $event_price=$row."Event Price" -replace "'", "\'"
      $regular_price=$row."Regular Price" -replace "'", "\'"
      $event_cost=$row."Event Cost ($)" -replace "'", "\'"
      $price_per=$row."Price per" -replace "'", "\'"
      $avg_subsidy_per_unit=$row."Avg Subsidy per unit ($)" -replace "'", "\'"
      $offer_type=$row."Offer Type" -replace "'", "\'"
      $buyers_forecast_units_total=$row."Buyers Forecast Units (Total)" -replace "'", "\'"
      $buyers_forecast_units_offer_version=$row."Buyers Forecast Units (Offer Version)" -replace "'", "\'"
      $buyers_forecast_units_item_level=$row."Buyers Forecast Units (Item Level)" -replace "'", "\'"
      $buyers_forecast_sales_total=$row."Buyers Forecast Sales (Total)" -replace "'", "\'"
      $buyers_forecast_sales_offer_version=$row."Buyers Forecast Sales (Offer Version)" -replace "'", "\'"
      $buyers_regular_cost=$row."Buyers Regular Cost ($)" -replace "'", "\'"
      $buyers_subsidy=$row."Buyers Subsidy ($)" -replace "'", "\'"
      $buyers_markdown=$row."Buyers Markdown ($)" -replace "'", "\'"
      $buyers_gross_profit=$row."Buyers Gross Profit ($)" -replace "'", "\'"
      $buyers_gross_profit_percent=$row."Buyers Gross Profit (%)" -replace "'", "\'"
      $replenishment_forecast_units_total=$row."Replenishment Forecast Units (Total)" -replace "'", "\'"
      $replenishment_forecast_units_offer_version=$row."Replenishment Forecast Units (Offer Version)" -replace "'", "\'"
      $replenishment_forecast_units_item_level=$row."Replenishment Forecast Units (Item Level)" -replace "'", "\'"
      $replenishment_forecast_sales_total=$row."Replenishment Forecast Sales (Total)" -replace "'", "\'"
      $replenishment_forecast_sales_offer_version=$row."Replenishment Forecast Sales (Offer Version)" -replace "'", "\'"
      $replenishment_regular_cost=$row."Replenishment Regular Cost ($)" -replace "'", "\'"
      $replenishment_subsidy=$row."Replenishment Subsidy ($)" -replace "'", "\'"
      $replenishment_markdown=$row."Replenishment Markdown ($)" -replace "'", "\'"
      $replenishment_gross_profit=$row."Replenishment Gross Profit ($)" -replace "'", "\'"
      $replenishment_gross_profit_percent=$row."Replenishment Gross Profit (%)" -replace "'", "\'"
      $promo_alignment=$row."Promo Alignment" -replace "'", "\'"
      $comments=$row.comments -replace "'", "\'"
      $super_center_only=$row."Super Center Only" -replace "'", "\'"
      $item_availibility_merchant=$row."Item Availibility (Merchant)" -replace "'", "\'"
      $item_availbility_replenishment=$row."Item Availbility (Replenishment)" -replace "'", "\'"
      $rfc=$row.RFC -replace "'", "\'"
      $available_online=$row."Available Online" -replace "'", "\'"
      $old_feature_items=$row."Old Feature Items" -replace "'", "\'"
      $multi_save_deal_type=$row."Multi Save (Deal Type)" -replace "'", "\'"
      $image_source=$row."Image Source" -replace "'", "\'"
      $pickedup_from=$row | get-member -type NoteProperty | ForEach-Object{
        $n = $_.Name
        $v = $row."$($_.Name)"
        if($n -like '*Picked Up From Week*')
        {
            return $v
        }
    }

}
}