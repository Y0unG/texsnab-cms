{* Информера корзины (отдаётся аяксом) *}

{if $cart->total_products>0}
	В <a href="./cart/">корзине</a>
	{$cart->total_products} {$cart->total_products|plural:'товар':'товаров':'товара'}
	на {$cart->total_price|convert} {$currency->sign|escape}
{else}
	<img src="/design/{$settings->theme|escape}/images/korzina_icon.png" width="29" height="27" style="float:left" alt=""/> <span style="padding:7px 13px 0px 25px;">Корзина пуста</span>
{/if}
