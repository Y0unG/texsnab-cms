{* Главная страница магазина *}
{* Для того чтобы обернуть центральный блок в шаблон, отличный от index.tpl *}
{* Укажите нужный шаблон строкой ниже. Это работает и для других модулей *}
{$wrapper = 'index.tpl' scope=parent}

{* Канонический адрес страницы *}
{$canonical="" scope=parent}


{* Рекомендуемые товары *}
{get_featured_products var=featured_products}
{if $featured_products}
<!-- Список товаров-->
<h1 class="tiny_products_h1_popular" style="font-size: 17px;color: #F03770; float:left">Популярные товары:</h1>
<img src="design/{$settings->theme|escape}/images/pupolar_products.png" width="715" height="9" alt=""/>
<br>
<ul class="tiny_products">

	{foreach $featured_products as $product}
	<!-- Товар-->
	<li class="product">
		

		<!-- Фото товара -->
		{if $product->image}    	 
        
		<div class="image">
         <img style="    margin: 4px 0px 0px 158px;
    height: 20px;
    width: 33px;
    padding: 0;
    background-color: aliceblue;" src="design/{$settings->theme|escape}/images/top_ico.png" width="33" height="20" alt=""/>
        <span style="font-size: 11px;
    padding: 9px 6px 4px 4px;
    color: #717171;
    margin: -22px 23px 1px 6px;
    float: left;">Артикул. {$product->variant->sku}</span><br>
			<a href="products/{$product->url}"><img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}"/></a>
		</div>
		{/if}
		<!-- Фото товара (The End) -->

		<!-- Название товара -->
		<h3><a data-product="{$product->id}" href="products/{$product->url}">{$product->name|escape}</a></h3>
		<!-- Название товара (The End) -->
		

		{if $product->variants|count > 0}
		<!-- Выбор варианта товара -->
		<form class="variants" action="/cart">
			<table>
			{foreach $product->variants as $v}
			<tr class="variant">
				<td>
					<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} {if $product->variants|count<2}style="display:none;"{/if}/>
				</td>
				<td>
					{if $v->name}<label class="variant_name" for="featured_{$v->id}">{$v->name}</label>{/if}
				</td>
				<td>
					
					<span class="price">{$v->price|convert} <span class="currency">{$currency->sign|escape}</span>
                    </span> 
				</td>
			</tr>
			{/foreach}
			</table>
			<input type="submit" class="button11" value="" data-result-text=""/>
		</form>
     
		<!-- Выбор варианта товара (The End) -->
		{else}
			Нет в наличии
		{/if}

	</li>
	<!-- Товар (The End)-->
	{/foreach}
			
</ul>
{/if}
<br>

{* Уцененные товары *}
{get_discounted_products var=discounted_products limit=8}
{if $discounted_products}
<h1 class="tiny_products_h1_popular" style="font-size: 17px;color: #006EA2; float:left">Уцененные товары:</h1>
<img src="design/{$settings->theme|escape}/images/Taittle_ycenennue.png" width="715" height="9" alt=""/><br><br>
<!-- Список товаров-->
<ul class="tiny_products">

	{foreach $discounted_products as $product}
	<!-- Товар-->
	<li class="product">
		
		<!-- Фото товара -->
		{if $product->image}
		<div class="image">
         <img style="margin:4px 0px 0px 171px;
    height: 20px;
    width: 26px;
    padding: 0;
    background-color: aliceblue;" src="design/{$settings->theme|escape}/images/ycenennue_producks_ico.png" width="26" height="20" alt=""/>
        <span style="font-size: 11px;
    padding: 9px 6px 4px 4px;
    color: #717171;
    margin: -22px 23px 1px 6px;
    float: left;">Артикул. {$product->variant->sku}</span><br>
			<a href="products/{$product->url}"><img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}"/></a>
		</div>
		{/if}
		<!-- Фото товара (The End) -->

		<!-- Название товара -->
		<h3><a data-product="{$product->id}" href="products/{$product->url}">{$product->name|escape}</a></h3>
		<!-- Название товара (The End) -->


		{if $product->variants|count > 0}
		<!-- Выбор варианта товара -->
		<form class="variants" action="/cart">
			<table>
			{foreach $product->variants as $v}
			<tr class="variant">
				<td>
					<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $v@first}checked{/if} {if $product->variants|count<2}style="display:none;"{/if}/>
				</td>
				<td>
					{if $v->name}<label class="variant_name" for="featured_{$v->id}">{$v->name}</label>{/if}
				</td>
				<td>
					
					<span class="price">{$v->price|convert} <span class="currency">{$currency->sign|escape}</span>
                    </span> 
				</td>
			</tr>
			{/foreach}
			</table>
			<input type="submit" class="button11" value="" data-result-text=""/>
		</form>
     
		<!-- Выбор варианта товара (The End) -->
		{else}
			Нет в наличии
		{/if}

	</li>
	<!-- Товар (The End)-->
	{/foreach}
			
</ul>
{/if}
<br>