{* Список товаров *}
{if ($sort == 'position')} {$sort='name'} {/if}{* временное решение *}
{* Канонический адрес страницы *}
{if $category && $brand}
{$canonical="/catalog/{$category->url}/{$brand->url}?page=all" scope=parent}
{elseif $category}
{$canonical="/catalog/{$category->url}?page=all" scope=parent}
{elseif $brand}
{$canonical="/brands/{$brand->url}?page=all" scope=parent}
{elseif $keyword}
{$canonical="/products?keyword={$keyword|escape}?page=all" scope=parent}
{else}
{$canonical="/products" scope=parent}
{/if}
<link rel="stylesheet" href="css/style.css" media="screen">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/gallery.js"></script>


<!-- Хлебные крошки /-->
<div id="path">
	<a href="/">Главная</a>
	{if $category}
	{foreach $category->path as $cat}
	→ <a href="catalog/{$cat->url}">{$cat->name|escape}</a>
	{/foreach}  
	{if $brand}
	→ <a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a>
	{/if}
	{elseif $brand}
	→ <a href="brands/{$brand->url}">{$brand->name|escape}</a>
	{elseif $keyword}
	→ Поиск
	{/if}
</div>
<!-- Хлебные крошки #End /-->

{* Заголовок страницы *}
{if $keyword}
<h1>Поиск {$keyword|escape}</h1>
{elseif $page}
<h1>{$page->name|escape}</h1>
{else}
<h1>{$category->name|escape} {$brand->name|escape}</h1>
{/if}


{* Описание страницы (если задана) *}
{$page->body}

{if $current_page_num==1}
{* Описание категории *}
{$category->description}
{/if}


{if $current_page_num==1}
{* Описание бренда *}
{$brand->description}
{/if}

{* Фильтр по свойствам *}
{if $features}
<table id="features">
	{foreach $features as $key=>$f}
	<tr>
	<td class="feature_name" data-feature="{$f->id}">
		{$f->name}:
	</td>
	<td class="feature_values">
		<a href="{url params=[$f->id=>null, page=>null]}" {if !$smarty.get.$key}class="selected"{/if}>Все</a>
		{foreach $f->options as $o}
		<a href="{url params=[$f->id=>$o->value, page=>null]}" {if $smarty.get.$key == $o->value}class="selected"{/if}>{$o->value|escape}</a>
		{/foreach}
	</td>
	</tr>
	{/foreach}
</table>
{/if}


<!--Каталог товаров-->
{if $products}

{* Сортировка *}
{if $products|count>0}
<div class="sort" style="float:right;">
	Сортировать по 
	{*<a {if $sort=='position'} class="selected"{/if} href="{url sort=position page=null}">умолчанию</a>*}
	<a {if $sort=='price'}    class="selected"{/if} href="{url sort=price page=null}">цене</a>
	<a {if $sort=='name'}     class="selected"{/if} href="{url sort=name page=null}">названию</a>
</div>
{/if}
<br>
<!-- Список товаров-->
<ul class="products">

	{foreach $products as $product}
	<!-- Товар-->
	<li class="product">
		
		<!-- Фото товара -->
		{if $product->image}    	 
        
		<div class="image">
         
        <span style="font-size: 11px;
    padding: 10px 6px 10px 11px;
    color: #717171;
    float: left;    width: 140px;">Артикул. {$product->variant->sku}</span><br>
         <a href="products/{$product->url}"><img src="{$product->image->filename|resize:200:200}" alt="{$product->name|escape}"/></a>
         
     </div>
		{else}
			<div class="image">

        <span style="font-size: 11px;
    padding: 10px 6px 10px 11px;
    color: #717171;
    float: left;    width: 140px;">Артикул. {$product->variant->sku}</span><br>
				<a href="products/{$product->url}"><img src="/files/products/empty_10.200x200.jpg" alt="{$product->name|escape}"/></a>
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
					<input id="featured_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" 
                    {if $v@first}checked{/if} {if $product->variants|count<2}style="display:none;"{/if}/>
				</td>
				<td>
					
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
		<div class="btn btn-out-of-stock">Нет в наличии</div>
		{/if}

		
		
	</li>
	<!-- Товар (The End)-->
	{/foreach}
			
</ul>

{include file='pagination.tpl'}	
<!-- Список товаров (The End)-->

{else}
Товары не найдены
{/if}
<!--Каталог товаров (The End)-->