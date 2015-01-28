<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang_iso}">
	<head>
		<title>{$meta_title|escape:'htmlall':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:html:'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:html:'UTF-8'}" />
{/if}
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<meta name="generator" content="PrestaShop" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,follow" />
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$img_ps_dir}favicon.ico" />
		<link rel="shortcut icon" type="image/x-icon" href="{$img_ps_dir}favicon.ico" />
{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
	<link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />
	{/foreach}
{/if}
		<script type="text/javascript" src="{$content_dir}js/tools.js"></script>
		<script type="text/javascript">
			var baseDir = '{$content_dir}';
			var static_token = '{$static_token}';
			var token = '{$token}';
			var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
			var roundMode = {$roundMode};
		</script>
		<script type="text/javascript" src="{$content_dir}js/jquery/jquery-1.2.6.pack.js"></script>
		<script type="text/javascript" src="{$content_dir}js/jquery/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="{$content_dir}js/jquery/jquery.hotkeys-0.7.8-packed.js"></script>
{if isset($js_files)}
	{foreach from=$js_files item=js_uri}
	<script type="text/javascript" src="{$js_uri}"></script>
	{/foreach}
{/if}
		{$HOOK_HEADER}
	</head>
	
	<body {if $page_name}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if}>
	{if !$content_only}
		<noscript><ul><li>{l s='This shop requires JavaScript to run correctly. Please activate JavaScript in your browser.'}</li></ul></noscript>
		<div id="wrap">
                    <div id="page">
			<!-- Header -->
			<div id="header">
				<div id="logo"><a href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}"><img src="{$content_dir}themes/mononduleur/img/logo_mononduleur.png" alt="{$shop_name|escape:'htmlall':'UTF-8'}" /></a></div>
				<div id="header_right">
<a href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}"><img src="{$content_dir}themes/mononduleur/img/logo_oxalion.png" alt="{$shop_name|escape:'htmlall':'UTF-8'}" style="margin-top: -12px;" /></a>
					{*$HOOK_TOP*}

<ul id="menu">
     <a href="{$base_dir}contact-form.php" title="Nous contacter" rel="nofollow"><li id="contact"><img src="{$content_dir}themes/mononduleur/img/menu_contact.png" alt="Contact" /></li></a>
     <a href="{$base_dir}sitemap.php" title="Plan du site"><li id="sitemap"><img src="{$content_dir}themes/mononduleur/img/menu_sitemap.png" alt="Plan du site" /></li></a>
     <a href="javascript:addBookmark('{$base_dir}', '{$shop_name|escape:'htmlall':'UTF-8'}')" title="Mettre en favoris"><li id="favoris"><img src="{$content_dir}themes/mononduleur/img/menu_favoris.png" alt="Favoris" /></li></a>
     <a href="{$base_dir}order.php" title="Votre panier"><li id="panier"><img src="{$content_dir}themes/mononduleur/img/menu_panier.png" alt="Votre panier" /></li></a>
     <a href="{$base_dir}my-account.php" title="Votre compte"><li id="compte"><img src="{$content_dir}themes/mononduleur/img/menu_compte.png" alt="Votre compte" /></li></a>
</ul>
				</div>
 <div style="clear:both;"></div>
			</div>
                        
			<div id="columns">
				<!-- Left -->
				<div id="left_column" class="column">
					{$HOOK_LEFT_COLUMN}
				</div>

				<!-- Center -->
				<div id="center_column">
	{/if}
