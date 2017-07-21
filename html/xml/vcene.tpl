<yml_catalog date="{$smarty.now|date_format:"%Y-%m-%d %H:%M:%S"}">
<shop>
	<name>{$settings->company_name|escape}</name>
	<url>{$config->root_url}</url>
	
	<currencies>
	{foreach $currencies as $currency}
		<currency id="{$currency->code}" rate="{$currency->rate_to}"/>
	{/foreach}
	</currencies>
	
	<categories>
	{foreach $categories as $category}
		<category id="{$category->id}" parentID="{$category->parent_id}">{$category->name|escape}</category>
	{/foreach}
	</categories>
	
	<items>
	{while ($p=$products->result())}
	{if $p->stock>0 || $p->stock==null}
		<item id="{$p->product_id}" available="{if $p->stock>0||$p->stock==null}true{else}false{/if}">
			<name>{$p->product_name|escape} {$p->sku}</name>
			{if $p->brand_name}<vendor>{$p->brand_name|escape}</vendor>{/if}
			<categoryId>{$p->category_id}</categoryId>
			<currencyId>{$currency->code}</currencyId>
			<price>{$p->price}</price>
			<url>{$config->root_url}/products/{$p->url}</url>
			<image>{$p->image|resize:800:600:w}</image>
			<description>{$p->annotation|strip_tags|escape}</description>
		</item>
		{/if}
	{/while}
	</items>

</shop>
</yml_catalog>