{* Информер сравнения товаров *}

{if $compare_informer->total>0}
	<div class="box">
		{t}В{/t} <a href="/compare/">{t}сравнении{/t}</a> {$compare_informer->total}
		{t}{$compare_informer->total|plural:'товар':'товаров':'товара'}{/t}
	</div>
{else}
	{* Список сравнения пуст *}
{/if}