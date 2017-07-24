{* Страница товара *}
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="js/gallery.js"></script>
{* Канонический адрес страницы *}
{$canonical="/products/{$product->url}" scope=parent}

<!-- Хлебные крошки /-->
<div id="path">
	<a href="./">Главная</a>
	{foreach $category->path as $cat}
	→ <a href="catalog/{$cat->url}">{$cat->name|escape}</a>
	{/foreach}
	{if $brand}
	→ <a href="catalog/{$cat->url}/{$brand->url}">{$brand->name|escape}</a>
	{/if}
	→  {$product->name|escape}                
</div>
<!-- Хлебные крошки #End /-->

<h1 class="h1_product_size" data-product="{$product->id}">{$product->name|escape}</h1>

<div class="product">

	<!-- Большое фото -->
	{if $product->image}
	<div class="image">
		<a href="{$product->image->filename|resize:800:600:w}" class="zoom" rel="group"><img src="{$product->image->filename|resize:300:300}" alt="{$product->product->name|escape}" /></a>
	</div>
	{/if}
	<!-- Большое фото (The End)-->

	<!-- Описание товара -->
	<div class="description">
	
		
		
		{if $product->variants|count > 0}
		<!-- Выбор варианта товара -->
		<form class="variants" action="/cart">
			<table>
			{foreach $product->variants as $v}
			<tr class="variant">
				<td>
					<input id="product_{$v->id}" name="variant" value="{$v->id}" type="radio" class="variant_radiobutton" {if $product->variant->id==$v->id}checked{/if} {if $product->variants|count<2}style="display:none;"{/if}/>
				</td>
				<td>
					{if $v->name}<label class="variant_name" for="product_{$v->id}">{$v->name}</label>{/if}
				</td>
				<td>
					
					<span class="price11">{$v->price|convert} <span class="currency" style="font-size:17px">{$currency->sign|escape}</span></span>
				</td>
             
             	<td>
				</td>
			</tr>
			{/foreach}
			</table>
			<input type="submit"  class="button12" value="" data-result-text=""/>
		</form>
		<!-- Выбор варианта товара (The End) -->
		{else}
			Нет в наличии
		{/if}
			<span style="padding: 9px 6px 4px 4px;
    color: #717171;
    margin: -2px 0px 0px -1px;
    float: left;"><span style="color: #ffffff;
    background-color: #cccccc;
    padding: 4px 5px 5px 8px;
    border-bottom-left-radius: 6px;
                               border-top-left-radius: 6px;font-size: 14px;">Арт.</span>
                     <span style="color: #626262;
    background-color: #F8F8F8;
    padding: 4px 10px 5px 7px;
    border-bottom-right-radius: 6px;
    border-top-right-radius: 6px;
    margin-left: -4px;
    font-size: 14px;">{$product->variant->sku}</span><br></span>
              <div class="catalog_dop_svoistvo" style="float:left"> 
               <span style="color: #FFFFFF;
    background-color: #888888;
    padding: 0px 0px 0px 0px;
    border-bottom-left-radius: 4px;
    border-top-left-radius: 4px;
    font-size: 12px;
    float: left;
    margin: 7px 2px -4px 4px;
    list-style-type: none;
    border-bottom-right-radius: 7px;
    border-top-right-radius: 9px;"> 
                {foreach $product->features as $f}
                  {if ($f->feature_id == '167')}
                  <li>
                      <label style="padding: 10px 2px 9px 7px;
    color: #FFFFFF;
    margin: 3px 1px 4px 1px;">
                      {$f->name}
                   	  </label>
                      <span style="color: #6D6D6D;
    background-color: #F8F8F8;
    padding: 0px 9px 0px 7px;
    border-bottom-right-radius: 4px;
    border-top-right-radius: 4px;
    margin-left: 9px;
    font-size: 12px;">{$f->value}
                      </span>
                  </li>
                  {/if}
                {/foreach}
              </div>
	</div>
	<!-- Описание товара (The End)-->
 
		<!-- Описание товара -->
		<div class="annotation_info_mini">{$product->annotation}</div>
		<!-- Описание товара (The End) -->
 
 
	<!-- Дополнительные фото продукта -->
	{if $product->images|count>1}
	<div class="images">
		{* cut удаляет первую фотографию, если нужно начать 2-й - пишем cut:2 и тд *}
		{foreach $product->images|cut as $i=>$image}
			<a href="{$image->filename|resize:800:600:w}" class="zoom" rel="group"><img src="{$image->filename|resize:95:95}" alt="{$product->name|escape}" /></a>
		{/foreach}
	</div>
	{/if}
	<!-- Дополнительные фото продукта (The End)-->
 
	
	{if $product->features}
 
	<!-- Характеристики товара -->
	<h2 style="font-size: 12px;color: #cccccc;margin-left:16px;">Характеристики и свойства товара: {$product->name|escape}</h2>
	
	<!-- Характеристики товара (The End)-->
	{/if}

	
</div>
<!-- Описание товара (The End)-->
 	<!-- ТАБЫ -->
<div id="container">

	

		<section class="tabs">
			<input id="tab_1" type="radio" name="radio_set" class="tab_selector_1" checked="checked" />
			<label for="tab_1" class="tab_label_1">Описание</label>
			
			<input id="tab_2" type="radio" name="radio_set" class="tab_selector_2" />
			<label for="tab_2" class="tab_label_2">Характеристики</label>
			
			<input id="tab_3" type="radio" name="radio_set" class="tab_selector_3" />
			<label for="tab_3" class="tab_label_3">Оплата и доставка</label>
			
			
			<div class="clear_shadow"></div>
			
			<div class="content">
				<div class="content_1">
					<p>{$product->body}</p>
				</div>
				
				<div class="content_2">
                    {if $product->features}

                    <!-- Характеристики товара -->
                    <ul class="features222">
                    {foreach $product->features as $f}
                    <li class="features333">
                        <label class="features222">{$f->name}</label>
                        <span class="features222">{$f->value}</span>
                    </li>
                    {/foreach}
                    </ul>
                    <!-- Характеристики товара (The End)-->
                    {/if}
				</div>
				
				<div class="content_3">
					<p>Оплата и доставка</p>
				</div>
             
			</div>
			
		</section>
	
	</div>
 <!-- ТАБЫ (The End)-->

<br><br><br><br>
{* Связанные товары *}
{if $related_products}
<h2>Покупатели, которые просматривали этот товар, также интересуются:</h2>
<!-- Список каталога товаров-->
<br><ul class="tiny_products">
	{foreach $related_products as $related_product}
	<!-- Товар-->
	<li class="product">
		
		<!-- Фото товара -->
		{if $related_product->image}
		<div class="image">
			<a href="products/{$related_product->url}"><img src="{$related_product->image->filename|resize:200:200}" alt="{$related_product->name|escape}"/></a>
		</div>
		{/if}
		<!-- Фото товара (The End) -->

		<!-- Название товара -->
		<h3><a data-product="{$related_product->id}" href="products/{$related_product->url}">{$related_product->name|escape}</a></h3>
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
<br><br>
<!-- Комментарии -->
<div id="comments">

	<h2>Отзывы</h2>
	
	{if $comments}
	<!-- Список с комментариями -->
	<ul class="comment_list">
		{foreach $comments as $comment}
		<a name="comment_{$comment->id}"></a>
		<li>
			<!-- Имя и дата комментария-->
			<div class="comment_header">	
				{$comment->name|escape} <i>{$comment->date|date}, {$comment->date|time}</i>
			</div>
			<!-- Имя и дата комментария (The End)-->
			
			<!-- Комментарий -->
			{$comment->text|escape|nl2br}
			<!-- Комментарий (The End)-->
		</li>
		{/foreach}
	</ul>
	<!-- Список с комментариями (The End)-->
	{else}
	<p>
		Пока нет комментариев
	</p>
	{/if}
	
	<!--Форма отправления комментария-->	
	<form class="comment_form" method="post">
		<h2>Написать комментарий</h2>
		{if $error}
		<div class="message_error">
			{if $error=='captcha'}
			Неверно введена капча
			{elseif $error=='empty_name'}
			Введите имя
			{elseif $error=='empty_comment'}
			Введите комментарий
			{/if}
		</div>
		{/if}
		<textarea class="comment_textarea" id="comment_text" name="text" data-format=".+" data-notice="Введите комментарий">{$comment_text}</textarea><br />
		<div>
		<label for="comment_name">Имя</label>
		<input class="input_name" type="text" id="comment_name" name="name" value="{$comment_name}" data-format=".+" data-notice="Введите имя"/><br />

		<input class="button" type="submit" name="comment" value="Отправить" />
		
		<label for="comment_captcha">Число</label>
		<div class="captcha"><img src="captcha/image.php?{math equation='rand(10,10000)'}" alt='captcha'/></div> 
		<input class="input_captcha" id="comment_captcha" type="text" name="captcha_code" value="" data-format="\d\d\d\d" data-notice="Введите капчу"/>
		
		</div>
	</form>
	<!--Форма отправления комментария (The End)-->
	
</div>
<!-- Комментарии (The End) -->

{* Увеличитель картинок *}
{literal}
<script type="text/javascript" src="js/fancybox/jquery.fancybox.pack.js"></script>
<link rel="stylesheet" href="js/fancybox/jquery.fancybox.css" type="text/css" media="screen" />

<script>
$(function() {
	// Раскраска строк характеристик
	$(".features li:even").addClass('even');

	// Зум картинок
	$("a.zoom").fancybox({
		prevEffect	: 'fade',
		nextEffect	: 'fade'});
	});
</script>
{/literal}