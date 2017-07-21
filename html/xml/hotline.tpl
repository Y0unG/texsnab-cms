<?xml version="1.0" encoding="UTF-8"?>
<price>
	<date>{$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}</date>
	<firmName>{$settings->company_name|escape}</firmName>
	<firmId>1234</firmId>
	
	{if $currency->code == 'USD'}
		<rate>{$currency->rate_to}</rate>
	{/if}
	
	<categories>
	{foreach $categories as $category}
		<category>
			<id>{$category->id}</id>
			{if $category->parent_id}<parentId>{$category->parent_id}</parentId>{/if}
			<name>{$category->name|escape}</name>
		</category>
	{/foreach}
	</categories>
	
	<items>
	{while ($p=$products->result())}
	{if $p->stock>0 || $p->stock==null}
		<item>
			<id>{$p->product_id}</id>
			<categoryId>{$p->category_id}</categoryId>
			<code>{$p->sku}</code>
			{if $p->brand_name}<vendor>{$p->brand_name|escape}</vendor>{/if}
			<name>{$p->product_name|escape}</name>
			<description>{$p->annotation|strip_tags|escape}</description>
			<url>{$config->root_url}/products/{$p->url}</url>
			<image>{$p->image|resize:800:600:w}</image>
			<priceR{$currency->code}>{$p->price}</priceR{$currency->code}>
			<stock>{if $p->stock>0 || $p->stock==null}На складе в Киеве{else}Нет в наличии{/if}</stock>
			 <guarantee>12 мес</guarantee> 
		</item>{/if}
	{/while}
	</items>
	
</price>