{* Сравнение товаров *}

{$meta_title = "Сравнения товаров" scope=parent}

<div id="compare">
<table>
<thead>
<tr class="first">
	<th nowrap style="vertical-align:middle;font-size:20px;text-align:center">
		Сравнение товаров
	</th>
	{if $compare->total>0}
	{foreach $compare->products as $product}
    <td class="image">
		<div>
			<a class="delete" href="compare/remove/{$product->id}">Убрать</a>
		
			<div style="padding: 10px">
			<!-- Фото товара -->
				{if $product->image}
				<div class="image">
					<a href="products/{$product->url}"><img src="{$product->image|resize:200:200}" alt="{$product->name|escape}"/></a>
				</div>
				{/if}
			<!-- Фото товара (The End) -->
				
			{if $product->variants|count > 0}
				<form action="/cart">
					
					{assign var=price value=0}
					{foreach $product->variants as $v}
						<input id="v_{$product->id}_{$v->id}" name="variant" value="{$v->id}" type="radio" style="display:none" class="variant_radiobutton" {if $v@first}checked{/if} {if $product->variants|count<2}style="display:none;"{/if}/>
						{if $v@first}
							{assign var=price value=$v->price}
						{/if}
					{/foreach}
					
					<div class="btn-group">
						<span class="btn btn-dgreen price">{$price|convert} {*<span class="currency">{$currency->sign|escape}</span>*}</span>
						<input type="submit" class="btn" value="Купить"/>
					</div>
					
				</form>
			{/if}
			
			</div>
		</div>
    </td>
    {/foreach}
</tr>

<tr>
	<th>Название</th>
	{foreach $compare->products as $product}
	<td class=""><h3><a data-product="{$product->id}" href="products/{$product->url}">{$product->name|escape}</a></h3></td>
	{/foreach}
</tr>

<tr>
	<th>Бренд</th>
	{foreach $compare->products as $product}
	<td class=""><a href="brands/{$product->brand_url}">{$product->brand|escape}</a></td>
	{/foreach}
</tr>
</thead>

<tbody>
	{foreach from=$compare->features key=k item=i}
	<tr {if $i.diff}class='diff'{/if}>
		<th {if $i.diff}class='diff'{/if}>{$k|escape}</th>
		{foreach from=$i.items item=ii}
		<td>{$ii}</td>
		{/foreach}
	</tr>
	{/foreach}
</tbody>

<tfoot>
<tr>
	<th>Краткое описание</th>
	{foreach $compare->products as $product}
	<td>{$product->annotation}</td>
	{/foreach}
</tr>

{else}
<tr>
	<td class="empty" colspan="2">Нет товаров для сравнения</td>
</tr>
{/if}
</tfoot>
</table>
</div>