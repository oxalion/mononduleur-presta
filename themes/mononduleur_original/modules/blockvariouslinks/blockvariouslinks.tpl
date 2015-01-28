<!-- MODULE Block various links -->
<ul class="block_various_links" id="block_various_links_footer" style="text-align:center">
	<li class="first_item"><a href="{$base_dir}best-sales.php" title="" rel="nofollow">Meilleures ventes</a></li>
	<li class="item"><a href="{$base_dir_ssl}contact-form.php" title="" rel="nofollow">Contactez-nous</a></li>
	{foreach from=$cmslinks item=cmslink}
		<li class="item"><a href="{$cmslink.link|addslashes}" title="{$cmslink.meta_title|escape:'htmlall':'UTF-8'}" rel="nofollow">{$cmslink.meta_title|escape:'htmlall':'UTF-8'}</a></li>
	{/foreach}
</ul>
<!-- /MODULE Block various links -->
