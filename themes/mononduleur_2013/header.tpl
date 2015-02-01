<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7 " lang="{$lang_iso}"> <![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8 ie7" lang="{$lang_iso}"> <![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9 ie8" lang="{$lang_iso}"> <![endif]-->
<!--[if gt IE 8]> <html class="no-js ie9" lang="{$lang_iso}"> <![endif]-->
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
    <meta http-equiv="content-language" content="{$meta_language}" />
    <meta name="generator" content="PrestaShop" />
    <meta name="robots" content="{if isset($nobots)}no{/if}index,{if isset($nofollow) && $nofollow}no{/if}follow" />
    <link rel="icon" type="image/vnd.microsoft.icon" href="{$favicon_url}?{$img_update_time}" />
    <link rel="shortcut icon" type="image/x-icon" href="{$favicon_url}?{$img_update_time}" />
    <script type="text/javascript">
      var baseDir = '{$content_dir}';
      var baseUri = '{$base_uri}';
      var static_token = '{$static_token}';
      var token = '{$token}';
      var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
      var priceDisplayMethod = {$priceDisplay};
      var roundMode = {$roundMode};
    </script>
    <link href="{$content_dir}/themes/mononduleur_2013/font/whhg.css" rel="stylesheet" type="text/css" media="screen" />
{if isset($css_files)}
  {foreach from=$css_files key=css_uri item=media}
  <link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />
  {/foreach}
{/if}
{if isset($js_files)}
  {foreach from=$js_files item=js_uri}
  <script type="text/javascript" src="{$js_uri}"></script>
  {/foreach}
{/if}
    {$HOOK_HEADER}

    <!--[if gte IE 9]>
      <style type="text/css">
        .gradient {
           filter: none;
        }
      </style>
    <![endif]-->

    <script>
    // $(document).ready(function() {
    // 	$("div.ad-banner-image").on('click', function (e) {
    // 		window.location = 'http://www.mononduleur.fr/promotions';
    // 	});
    // });
    </script>
  </head>

  <body {if isset($page_name)}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if} class="{if $hide_left_column} hide-left-column{/if} {if $hide_right_column} hide-right-column{/if} {if $content_only} content_only {/if}">
  {if !$content_only}
    {if isset($restricted_country_mode) && $restricted_country_mode}
    <div id="restricted-country">
      <p>{l s='You cannot place a new order from your country.'} <span class="bold">{$geolocation_country}</span></p>
    </div>
    {/if}
    <div class ="ad-banner-image" >
      <!-- EMPTY DIV -->
    </div>
    <div id="page" class="container_9 clearfix main-content-block">

      <!-- Header -->
      <div id="header" class="grid_9 alpha omega">
        <a id="header_logo" href="{$base_dir}" title="{$shop_name|escape:'htmlall':'UTF-8'}">
          <img class="logo" src="{$base_dir}/themes/mononduleur_2013/img/logo_mononduleur.png" alt="{$shop_name|escape:'htmlall':'UTF-8'}" {if $logo_image_width}width="{$logo_image_width}"{/if} {if $logo_image_height}height="{$logo_image_height}" {/if} />
        </a>
        <div id="header_right" class="grid_9 omega">
          {$HOOK_TOP}
        </div>
      </div>

      <div id="columns" class="grid_9 alpha omega clearfix gradient">
        <!-- Left -->
        <div id="left_column" class="column grid_2 alpha">
          {$HOOK_LEFT_COLUMN}
        </div>

        <!-- Center -->
        <div id="center_column" class=" grid_5">
  {/if}
