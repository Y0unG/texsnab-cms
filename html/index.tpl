<!DOCTYPE html>
{*
	Общий вид страницы
	Этот шаблон отвечает за общий вид страниц без центрального блока.
*}
<html>
<head>
	<base href="{$config->root_url}/"/>
	<title>{$meta_title|escape}</title>
	
	{* Метатеги *}
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="{$meta_description|escape}" />
	<meta name="keywords"    content="{$meta_keywords|escape}" />
	<meta name="viewport" content="width=1024"/>
	
	{* Канонический адрес страницы *}
	{if isset($canonical)}<link rel="canonical" href="{$config->root_url}{$canonical}"/>{/if}
	
	{* Стили *}
	<link href="design/{$settings->theme|escape}/css/style.css" rel="stylesheet" type="text/css" media="screen"/>
	<link href="design/{$settings->theme|escape}/images/favicon.ico" rel="icon"          type="image/x-icon"/>
	<link href="design/{$settings->theme|escape}/images/favicon.ico" rel="shortcut icon" type="image/x-icon"/>
	{* Bootstrap *}
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script src="js/libs/bootstrap.min.js"></script>
	
	{* JQuery *}
	<script src="js/jquery/jquery.js"  type="text/javascript"></script>
	
	{* Всплывающие подсказки для администратора *}
	{if $smarty.session.admin == 'admin'}
	<script src ="js/admintooltip/admintooltip.js" type="text/javascript"></script>
	<link   href="js/admintooltip/css/admintooltip.css" rel="stylesheet" type="text/css" /> 
	{/if}
	
	{* Ctrl-навигация на соседние товары *}
	<script type="text/javascript" src="js/ctrlnavigate.js"></script>           
	
	{* Аяксовая корзина *}
	<script src="design/{$settings->theme}/js/jquery-ui.min.js"></script>
	<script src="design/{$settings->theme}/js/ajax_cart.js"></script>
	
	{* js-проверка форм *}
	<script src="js/baloon/js/baloon.js" type="text/javascript"></script>
	<link   href="js/baloon/css/baloon.css" rel="stylesheet" type="text/css" /> 
 
	{* Animation form brunds *}
	<link href="css/hover.css" rel="stylesheet" media="all">
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet" media="all">
 
	{* Автозаполнитель поиска *}
	{literal}
	<script src="js/autocomplete/jquery.autocomplete-min.js" type="text/javascript"></script>
	<style>
		.autocomplete-suggestions{
		background-color: #ffffff;
		overflow: hidden;
		border: 1px solid #e0e0e0;
		overflow-y: auto;
		}
		.autocomplete-suggestions .autocomplete-suggestion{cursor: default;}
		.autocomplete-suggestions .selected { background:#F0F0F0; }
		.autocomplete-suggestions div { padding:2px 5px; white-space:nowrap; }
		.autocomplete-suggestions strong { font-weight:normal; color:#3399FF; }
	</style>	
	<script>
	$(function() {
		//  Автозаполнитель поиска
		$(".input_search").autocomplete({
			serviceUrl:'ajax/search_products.php',
			minChars:1,
			noCache: false, 
			onSelect:
				function(suggestion){
					 $(".input_search").closest('form').submit();
				},
			formatResult:
				function(suggestion, currentValue){
					var reEscape = new RegExp('(\\' + ['/', '.', '*', '+', '?', '|', '(', ')', '[', ']', '{', '}', '\\'].join('|\\') + ')', 'g');
					var pattern = '(' + currentValue.replace(reEscape, '\\$1') + ')';
	  				return (suggestion.data.image?"<img align=absmiddle src='"+suggestion.data.image+"'> ":'') + suggestion.value.replace(new RegExp(pattern, 'gi'), '<strong>$1<\/strong>');
				}	
		});
	});
	</script>
	{/literal}
 {* гугл фонт *}
 <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>
	
 {* <link href="style/css/bootstrap.css" rel="stylesheet">
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <script type="text/javascript" src="style/css/bootstrap.min.css"></script>	*}
	{literal}
		<!-- Google.analytics counter -->
		<script>
			(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
						(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
					m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
			})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

			ga('create', 'UA-78821184-1', 'auto');
			ga('send', 'pageview');
		</script>
		<!-- !Google.analytics counter -->
		<!-- Yandex.Metrika counter -->
		<script type="text/javascript">
			(function (d, w, c) {
				(w[c] = w[c] || []).push(function() {
					try {
						w.yaCounter37972300 = new Ya.Metrika({
							id:37972300,
							clickmap:true,
							trackLinks:true,
							accurateTrackBounce:true,
							webvisor:true
						});
					} catch(e) { }
				});

				var n = d.getElementsByTagName("script")[0],
						s = d.createElement("script"),
						f = function () { n.parentNode.insertBefore(s, n); };
				s.type = "text/javascript";
				s.async = true;
				s.src = "https://mc.yandex.ru/metrika/watch.js";

				if (w.opera == "[object Opera]") {
					d.addEventListener("DOMContentLoaded", f, false);
				} else { f(); }
			})(document, window, "yandex_metrika_callbacks");
		</script>
		<noscript><div><img src="https://mc.yandex.ru/watch/37972300" style="position:absolute; left:-9999px;" alt="" /></div></noscript>
		<!-- /Yandex.Metrika counter -->
	{/literal}
</head>
<body>

	
	
	<!-- Шапка -->
	<header>
	<div class="container">
		<div class="row">
			<div itemscope itemtype="http://schema.org/Organization">
					<div class="col-xs-12 col-sm-2 col-lg-3">
						<a href="/"><img src="images/logo_header.png"/></a>
					</div>
				<div class="col-xs-12 col-sm-3 col-lg-3">
					<p class="dark-gray desc"><span class="blue" itemprop="name">“Киевоблагротехпостач”</span><br/>
						частное акционерное общество<br/>
						<span class="blue">магазин автозапчастей</span>
					</p>
				</div>

				<div class="col-xs-7 col-sm-3 col-lg-3">
					<address>
						<a href="tel:+380444526330"><span class="blue" itemprop="telephone">(044)</span> 452-63-30</a><br/>
						<a href="tel:+380444526330"><span class="blue" itemprop="telephone">(044)</span> 452-63-31</a><br/>
						<a href="mailto:zakaz@texsnab.kiev.ua"><span class="blue" itemprop="email">zakaz@texsnab.kiev.ua</span></a><br/>
					</address>
				</div>
			</div>
			<div class="col-xs-5 col-sm-4 col-lg-3">
                {* Обновляемая аяксом корзина должна быть в отдельном файле *}
                {include file='cart_informer.tpl'}
			</div>
		</div>

	</div>
     <!-- Корзина -->

		<!-- Корзина (The End)-->

	{*	<!-- Вход пользователя -->
		<div id="account">
			{if $user}
				<span id="username">
					<a href="user">{$user->name}</a>{if $group->discount>0},
					ваша скидка &mdash; {$group->discount}%{/if}
				</span>
				<a id="logout" href="user/logout">выйти</a>
			{else}
				<a id="register" href="user/register">Регистрация</a>
				<a id="login" href="user/login">Вход</a>
			{/if}
		</div>
		<!-- Вход пользователя (The End)-->
        *}


<!-- Меню -->

	<div class="menu col-xs-12">
		<div class="container">
			<div class="row">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
							data-target="#main_top_menu" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="collapse navbar-collapse" id="main_top_menu">
					<ul class="nav navbar-nav">
						{foreach $pages as $p}
						 {*Выводим только страницы из первого меню*}
							{if $p->menu_id == 1}
								<li {if $page && $page->id == $p->id}class="selected"{/if}>
								 <a data-page="{$p->id}" href="{$p->url}">{$p->name|escape}</a>
								</li>
							{/if}
						{/foreach}
					</ul>
					<div class="nav navbar-right search-wrapper">
						<input type="text">
						<button class="glyphicon glyphicon-search" aria-hidden="true"></button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Меню (The End) -->
	</header>
	<!-- Шапка (The End)-->
	<!-- Вся страница -->
 {if $page && $page->url==''}
	 <div class="jumbotron">
		 <div class="container">
			 <div class="row">
				 <div class="col-md-7 col-sm-12 col-xs-8">
					 <img class="tittle-big" src="images/img_tittle_header.png">
					 <div class="col-sm-9 col-xs-8">
						 <button type="button" class="btn-price-list pull-right">
							 <a href="/files/uploads/pricelist/price.xlsx">Прайс лист</a></button>
					 </div>
				 </div>
				 <div class="col-md-5 col-xs-6 best-pr-wrapper">
					 <img class="tittle-small" src="design/{$settings->theme|escape}/images/prawo-sale-bg.png" width="346" height="285" alt=""/>
					 <div class="best-pr">
						 <div class="row">
							 <div itemscope itemtype="http://schema.org/Product">
								 <div class="tiny_products_mini">
									 {*Акционные товары*}
                                     {get_discounted_products var=discounted_products category_id=[1211] limit=1}
                                     {if $discounted_products}
										 <!-- Список товаров-->
                                             {foreach $discounted_products as $product}
												 <!-- Товар-->

													 <!-- Фото товара -->
                                                     {if $product->image}
														 <div class="col-xs-4">
															 <div class="image">
																 <a href="products/{$product->url}"><img src="{$product->image->filename|resize:150:150}"
																										 alt="{$product->name|escape}"/></a>
															 </div>
														 </div>
                                                     {/if}
													 <!-- Фото товара (The End) -->



                                                     {if $product->variants|count > 0}
														 <!-- Выбор варианта товара -->
									 <div class="col-xs-4" itemscope itemtype="http://schema.org/Product">
														 <form class="variants" action="/cart">
															 <!-- Название товара -->
															 <span itemprop="name"><a data-product="{$product->id}" href="products/{$product->url}">
                          {$product->name|escape}</a></span>
															 <!-- Название товара (The End) -->
															 <!-- АРТИКУЛ -->
															 <small>Артикул.{$product->variant->sku}</small>
															 <!-- АРТИКУЛ  (The End) -->

                                                                 {foreach $product->variants as $v}
                                                                             {if $v->name}<label class="variant_name" for="discounted_{$v->id}">{$v->name}</label>{/if}
																			 <span class="price" itemprop="price">{$v->price|convert} <span class="currency">
                                      {$currency->sign|escape}</span></span>
                                                                 {/foreach}

															 <a data-product="{$product->id}" href="products/{$product->url}">Подробнее</a>
														 </form>
									 </div>
														 <!-- Выбор варианта товара (The End) -->
                                                     {else}
														 Нет в наличии
                                                     {/if}
												 <!-- Товар (The End)-->
                                             {/foreach}
                                     {/if}
								 </div>
						 </div>
					 </div>
				 </div>
			 </div>
		 </div>
	 </div>
	 </div>
		 {/if}


 {*<div class="container">*}
	 {*<div class="row">*}
		 {*<div class="col-xs-12">*}
			 {*<div class="col-xs-6">*}
				 {*<div class="btn-group small-marks">*}
					 {*<button type="button" class="btn dropdown-toggle" data-toggle="dropdown"*}
							 {*aria-haspopup="true" aria-expanded="false">*}
						 {*<span>Подбор автозапчастей <br> по автомобилю <span class="caret"></span></span>*}
					 {*</button>*}
					 {*<div class="dropdown-menu">*}
						 {*<a href="/"><img src="images/marks/daewoo_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/shewrole_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/gaz_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/geely_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/jac_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/chery.png"></a>*}
						 {*<a href="/"><img src="images/marks/bogdan_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/zil_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/opel_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/waz-ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/lada_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/12_ico.png"></a>*}
						 {*<a href="/"><img src="images/marks/maz_ico.png"></a>*}
					 {*</div>*}
				 {*</div>*}
			 {*</div>*}
			 {*<div class="col-xs-6">*}
				 {*<div class="btn-group small-catalog">*}
					 {*<button type="button" class="btn dropdown-toggle btn-catalog" data-toggle="dropdown"*}
							 {*aria-haspopup="true" aria-expanded="false">*}
						 {*<span class="catalog list-group-item">Каталог товаров <span class="caret"></span></span>*}
					 {*</button>*}
					 {*<div class="dropdown-menu">*}
    {*{function name=categories_tree}*}
        {*{if $categories}*}
            {*{foreach $categories as $c}*}
                {*{if $c->visible}*}
                    {*{if in_array($category->id, $c->children)} class="active"{/if}*}
					{*<a style="text-decoration: none; width:200px;" href="catalog/{$c->url}" data-category="{$c->id}" class="list-group-item">{$c->name}</a>*}
                    {*{if in_array($category->id, $c->children)}{categories_tree categories=$c->subcategories}{/if}*}
                {*{/if}*}
            {*{/foreach}*}

        {*{/if}*}
    {*{/function}*}
    {*{categories_tree categories=$categories}*}
					 {*</div>*}
				 {*</div>*}
			 {*</div>*}
		 {*</div>*}
	 {*</div>*}
 {*</div>*}
	<div class="cat-slider-wrapper col-xs-12">
		<div class="container">
			<div class="row">
				<div class="col-xs-12 large-marks">
					<span class="marks">подбор автозапчастей по автомобилю</span>
					<a href="/"><img src="images/marks/daewoo_ico.png"></a>
					<a href="/"><img src="images/marks/shewrole_ico.png"></a>
					<a href="/"><img src="images/marks/gaz_ico.png"></a>
					<a href="/"><img src="images/marks/geely_ico.png"></a>
					<a href="/"><img src="images/marks/jac_ico.png"></a>
					<a href="/"><img src="images/marks/chery.png"></a>
					<a href="/"><img src="images/marks/bogdan_ico.png"></a>
					<a href="/"><img src="images/marks/zil_ico.png"></a>
					<a href="/"><img src="images/marks/opel_ico.png"></a>
					<a href="/"><img src="images/marks/waz-ico.png"></a>
					<a href="/"><img src="images/marks/lada_ico.png"></a>
					<a href="/"><img src="images/marks/12_ico.png"></a>
					<a href="/"><img src="images/marks/maz_ico.png"></a>
				</div>
			</div>
		</div>
	</div>
	<div class="catalog-wrapper col-xs-12">
		<div class="container">
			<div class="row ">
				<div class="col-sm-3">
					<div class="list-group large-catalog">
						<span class="catalog list-group-item">Каталог товаров</span>
                        {function name=categories_tree}
                            {if $categories}
                                    {foreach $categories as $c}
                                        {if $c->visible}
											{if in_array($category->id, $c->children)} class="active"{/if}
												<a style="text-decoration: none; width:200px;" href="catalog/{$c->url}" data-category="{$c->id}" class="list-group-item">{$c->name}</a>
                                                {if in_array($category->id, $c->children)}{categories_tree categories=$c->subcategories}{/if}
                                        {/if}
                                    {/foreach}
                            {/if}
                        {/function}
                        {categories_tree categories=$categories}

					</div>

					<div class="news-watched">
						<img class="attention" src="images/Sale_big.jpg" height="171" width="238">
						<!-- Просмотренные товары -->
						<div class="watched col-xs-12">
							<h5>Вы просматривали:</h5>

                            {get_browsed_products var=browsed_products limit=4}
                            {if $browsed_products}

								<ul class="browsed_products">
                                    {foreach $browsed_products as $browsed_product}
										<li>
											<a href="products/{$browsed_product->url}"><img src="{$browsed_product->image->filename|resize:50:50}" alt="{$browsed_product->name|escape}" title="{$browsed_product->name|escape}"></a>
										</li>
                                    {/foreach}
								</ul>
                            {/if}
						</div>
						<!-- Просмотренные товары -->
						<!-- Меню блога -->
                        {* Выбираем в переменную $last_posts последние записи *}
                        {get_posts var=last_posts limit=2}
                        {if $last_posts}
							<div id="blog_menu">
								<h2 style="font-size:18px"><a href="blog">Новости</a>, статьи и обзоры</h2>
                                {foreach $last_posts as $post}
									<ul style="    width: 191px;
    border: 1px solid #cccccc;
    padding: 15px 14px 16px 15px;
    line-height: 13px;
    margin: 0px 0px 19px 1px;
    list-style-type: none;">

										<li data-post="{$post->id}">
                    <span style="margin-bottom: 5px !important; width:189px !important; height:141px !important; ">
                    {$post->annotation}
                     </span>
											<a style="font-size:13px;text-decoration: none;color: #000000;" href="blog/{$post->url}">{$post->name|escape}</a><br><br>
											<span style="font-size:12px;color:#959595;">{$post->date|date}</span> <a href="blog/{$post->url}"style="font-size:13px;text-decoration: none;float: right;">Подробнее</a> </li>
									</ul>
                                {/foreach}
							</div>
                        {/if}
						<!-- Меню блога  (The End) -->
					</div>
				</div>



	<div class="col-xs-12 col-sm-9 products" itemscope itemtype="http://schema.org/ItemList">
		<!-- Основная часть --> 
		<div id="content">
			{$content}

		</div>
     
		<!-- Основная часть (The End) -->

	</div>
			</div>
		</div>
	</div>

				{if $page && $page->url==''}
	<!-- Вся страница (The End)-->
	<div class="container alsoo col-sm-12">
		<h5 class="down-header">Так же в нашем магазине огромный выбор запчастей для:</h5>
		<div class="row">
			<div class="also">
				<div class="tata col-xs-3">

					<button class="btn-watch"><a href="/auto/catalog/paz-bogdan-foton-isuzu">Смотреть каталог</a></button>
				</div>
				<div class="i-van col-xs-3">

					<button class="btn-watch">Смотреть каталог</button>
				</div>
				<div class="jac col-xs-3">

					<button class="btn-watch">Смотреть каталог</button>
				</div>
				<div class="chery col-xs-3">

					<button class="btn-watch">Смотреть каталог</button>
				</div>
			</div>
		</div>
	</div>
 {*<div id="dop_kcategorii">*}
         {*Так же в нашем магазине огромный выбор запчастей для:*}
 		 		{*<center><table width="1025" border="1" style="margin-left:20px;margin-top:200px">*}
  				{*<tbody>*}
                    {*<tr>*}
                      {*<td><a href="/auto/catalog/paz-bogdan-foton-isuzu" class="tables_button">Смотреть каталог</a></td>*}
                      {*<td><a href="#" class="tables_button">Смотреть каталог</a></td>*}
                      {*<td><a href="#" class="tables_button">Смотреть каталог</a></td>*}
                      {*<td><a href="#" class="tables_button">Смотреть каталог</a></td>*}
                    {*</tr>*}
                  {*</tbody>*}
                {*</table>*}
				{*</center>*}
 		{*</div>*}
 
 <div id="info_tex_texsnab">
          	 <div class="Logo_mini_o_nas" style="margin-top:-14px">
            		<img src="/design/{$settings->theme|escape}/images/Logo_nemnogog-Onas.png" width="146" height="45" alt=""/>
            </div>
   
   		<div class="info_tex_podrobno">		
  			{* Заголовок страницы *}
			<h1 style="font-size: 18px;color: #A0A0A0;">{$page->header}</h1>

             {* Тело страницы *}
             {$page->body}
  			</div>   
  {/if}
 		</div>
	<!-- Футер --><br>
 {*<div id="sposobu_oplatu">*}
              {*<div class="sposobu_oplatu_width">*}
                     {*<div class="oplata_ico">*}
                        {*<img src="/design/{$settings->theme|escape}/images/iconki_oplata.jpg" width="555" height="44" alt=""/> *}
                    {*</div>*}
                     {*<div class="button_oplata">*}
                        {*<a href="#" class="sulka_button_oplata">Способы оплаты</a>*}
                     {*</div>*}
              {*</div>*}
     	{*</div>*}
	<div class="container payment">
		<div class="row">
			<ul class="payments">
				<li class="discover"><a href="#"></a></li>
				<li class="visa"><a href="#"></a></li>
				<li class="mastercard"><a href="#"></a></li>
				<li class="maestro"><a href="#"></a></li>
				<li class="cirrus"><a href="#"></a></li>
				<li class="paypal"><a href="#"></a></li>
				<li class="western-union"><a href="#"></a></li>
				<li class="visa-electron"><a href="#"></a></li>
				<li class="skrill"><a href="#"></a></li>
			</ul>
		</div>
	</div>
	<div class="container ">
		<div class="row footer col-xs-12">
			<div class="footer-left col-sm-6 col-xs-12">
				<img src="images/logo_header.png" height="46" width="270">
				<br>
				<span>© 2010-2015 интернет-магазин «TEXSNAB»</span>
			</div>
			<div class="footer-right col-sm-6">
				<ul class="nav footer-links">
					<li><a href="#">Контакты</a></li>
					<li><a href="#">Оплата и доставка</a></li>
					<li><a href="#">Статьи и новости</a></li>
					<li><a href="#">О предприятии</a></li>
				</ul>
			</div>
		</div>
	</div>
	{*<div id="footer">*}
     	{*<div class="footer_width">*}
			{*<div class="logo_block_footer">*}
             {*<img src="/design/{$settings->theme|escape}/images/logo_header.png" width="270" height="46" alt=""/>*}
             {*<p style="font-size:13px">© 2010-2015 интернет-магазин «TEXSNAB»</p>*}
     		{*</div>*}
 			{*<div class="block_footer">*}
             		{*<div class="li_block_footer">*}
                     {*<span>        </span>*}
                     {*<ul class="ul_block_footer">*}
                      {*<!--<li>Контакты</li>*}
                      {*<li>Оплата</li>*}
                      {*<li>Доставка</li>*}
                      {*<li>Статьи и Новости</li>*}
                      {*<li>О предприятии</li>-->*}
                     {*</ul>*}
             		{*</div>*}
             		{*<div class="li_block_footer">*}
                     {*<span>               </span>*}
                     {*<ul class="ul_block_footer">*}
                      {*<li>         </li>*}
                      {*<!--<li>Оплата</li>*}
                      {*<li>Доставка</li>*}
                      {*<li>Статьи и Новости</li>*}
                      {*<li>О предприятии</li>-->*}
                     {*</ul>*}
             		{*</div>*}
             		{*<div class="li_block_footer">*}
                     {*<span>    </span>*}
                     {*<ul class="ul_block_footer">*}
                      {*<a href="/contact">Контакты</a><br>*}
                      {*<a href="/oplata">Оплата</a><br>*}
                      {*<a href="/dostavka">Доставка</a><br>*}
                      {*<a href="/blog">Статьи и Новости</a><br>*}
                      {*<a href="/o-predpriyatii">О предприятии</a>*}
                    {*</ul>*}
             		{*</div>*}
 			{*</div>*}
     {*</div>*}
	{*</div>*}
	<!-- Футер (The End)--> 
	
</body>
</html>