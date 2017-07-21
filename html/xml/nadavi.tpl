<?xml version="1.0" encoding="UTF-8"?>
<price date="{$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}">
	
	<name>{$settings->company_name|escape}</name>
	{if $currency->rate_to > 1}<currency code="{$currency->code}">{$currency->rate_to}</currency>{/if}
	
	<catalog>
	{foreach $categories as $category}
		<category id="{$category->id}" parentID="{$category->parent_id}">{$category->name|escape}</category>
	{/foreach}
	</catalog>
	
	<items>
	{while ($p=$products->result())}
	{if $p->stock>0 || $p->stock==null}
	{if ($p->category_id == 140)}
		<item id="{$p->product_id}">
			<name>{$p->product_name|escape}</name>
			{if $p->brand_name}<vendor>{$p->brand_name|escape}</vendor>{/if}
			<categoryId>{$p->category_id}</categoryId>
			<price>{$p->price}</price>
			{* <bnprice>{$p->price}</bnprice> *}
			<url>{$config->root_url}/products/{$p->url}</url>
			<image>{$p->image|resize:800:600:w}</image>
			<description>{$p->annotation|strip_tags|escape}</description>
			{* <warranty>12</warranty> *}
			{* <available>Склад либо Заказ</available> *}
		</item>{/if}{/if}
	{/while}
	</items>
</price>