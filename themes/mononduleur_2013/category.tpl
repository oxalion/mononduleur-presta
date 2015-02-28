{include file="$tpl_dir./breadcrumb.tpl"}
{include file="$tpl_dir./errors.tpl"}

{if isset($category)}
	{if $category->id AND $category->active}
		<h1>
			{strip}
				{$category->name|escape:'htmlall':'UTF-8'}
				{if isset($categoryNameComplement)}
					{$categoryNameComplement|escape:'htmlall':'UTF-8'}
				{/if}
			{/strip}
		</h1>

		{if $scenes || $category->description || $category->id_image}
		<div class="content_scene_cat">
			{if $scenes}
				<!-- Scenes -->
				{include file="$tpl_dir./scenes.tpl" scenes=$scenes}
			{else}
				<!-- Category image -->
				{if $category->id_image}
				<div class="align_center">
					<img src="{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'category_default')}" alt="{$category->name|escape:'htmlall':'UTF-8'}" title="{$category->name|escape:'htmlall':'UTF-8'}" id="categoryImage" width="{$categorySize.width}" height="{$categorySize.height}" />
				</div>
				{/if}
			{/if}

			{if $category->description}
				<div class="cat_desc">
				{if strlen($category->description) > 250}
					<div id="category_description_short">{$category->description|truncate:120}</div>
					<div id="category_description_full" style="display:none">{$category->description}</div>
					<a href="#" onclick="$('#category_description_short').hide(); $('#category_description_full').show(); $(this).hide(); return false;" class="lnk_more">{l s='More'}</a>
				{else}
					<div>{$category->description}</div>
				{/if}
				</div>
			{/if}
		</div>
		{/if}
		
		{if isset($subcategories)}
		<!-- Subcategories -->
		<div id="subcategories">
			<h3>{l s='Subcategories'}</h3>
			<ul class="inline_list">
			{foreach from=$subcategories item=subcategory}
				<li class="clearfix">
					<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" title="{$subcategory.name|escape:'htmlall':'UTF-8'}" class="img">
						{if $subcategory.id_image}
							<img src="{$link->getCatImageLink($subcategory.link_rewrite, $subcategory.id_image, 'mo_sous_categorie')}" alt="{$subcategory.name|escape:'htmlall':'UTF-8'}" />
						{else}
							<img src="{$img_cat_dir}default-2013_sous_categorie.jpg" alt="image par defaut" />
						{/if}
					</a><br />
					<a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}" class="cat_name">{$subcategory.name|escape:'htmlall':'UTF-8'}</a>
				</li>
			{/foreach}
			</ul>
			<br class="clear"/>
		</div>
		{/if}

		{if $products}

			<div class="resumecat category-product-count">
				{include file="$tpl_dir./category-count.tpl"}
			</div>
			<div id="liste-produits">
				<h3>{l s='Produits correspondants'}</h3>
				<div class="content_sortPagiBar">
					{include file="$tpl_dir./pagination.tpl"}
					<div class="sortPagiBar clearfix">
						{include file="./product-sort.tpl"}
						{include file="./product-compare.tpl"}
						{include file="./nbr-product-page.tpl"}
					</div>
				</div>
				
				{include file="./product-list.tpl" products=$products}
				
				<div class="content_sortPagiBar">
					<div class="sortPagiBar clearfix">
						{include file="./product-sort.tpl"}
						{include file="./product-compare.tpl"}
						{include file="./nbr-product-page.tpl"}
					</div>
					{include file="./pagination.tpl"}
				</div>
			</div>
		{/if}
	{elseif $category->id}
		<p class="warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{/if}
