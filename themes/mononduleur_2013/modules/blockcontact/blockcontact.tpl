<div id="contact_block" class="block">
	<p class="title_block">{l s='Contact us' mod='blockcontact'}</p>
	<div class="block_content clearfix">
			<p>{l s='Our hotline is available 24/7' mod='blockcontact'}</p>
			{if $telnumber != ''}
			<p>
				<i class="icon-fixed-width icon-no-decoration icon-phonealt"></i>
				<span class="label">{l s='Phone:' mod='blockcontact'}</span>{$telnumber|escape:'htmlall':'UTF-8'}</p>
			<p>
				<i class="icon-fixed-width icon-no-decoration icon-mobile"></i>
				<span class="label">{l s='Phone:' mod='blockcontact'}</span>{l s='06 95 73 27 82' mod='blockcontact'}</p>{/if}

			{if $email != ''}<a href="mailto:{$email|escape:'htmlall':'UTF-8'}">{l s='Contact our hotline' mod='blockcontact'}</a>{/if}
	</div>
</div>
