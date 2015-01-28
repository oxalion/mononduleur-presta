<!-- Block myaccount module -->
<div class="block myaccount">
	<p class="title_block"><a href="{$link->getPageLink('my-account', true)}" title="{l s='My account' mod='blockmyaccount'}">{l s='My account' mod='blockmyaccount'}</a></p>
	<div class="block_content">
		<ul class="bullet">
			<li>
				<a href="{$link->getPageLink('history', true)}" title="{l s='My orders' mod='blockmyaccount'}"><i class="icon icon-fixed-width icon-no-decoration icon-chevron-right"></i>{l s='My orders' mod='blockmyaccount'}</a>
			</li>
			{if $returnAllowed}
			<li>
				<a href="{$link->getPageLink('order-follow', true)}" title="{l s='My merchandise returns' mod='blockmyaccount'}"><i class="icon icon-fixed-width icon-no-decoration icon-chevron-right"></i>{l s='My merchandise returns' mod='blockmyaccount'}</a>
			</li>
			{/if}
			<li>
				<a href="{$link->getPageLink('order-slip', true)}" title="{l s='My credit slips' mod='blockmyaccount'}"><i class="icon icon-fixed-width icon-no-decoration icon-chevron-right"></i>{l s='My credit slips' mod='blockmyaccount'}</a>
			</li>
			<li>
				<a href="{$link->getPageLink('addresses', true)}" title="{l s='My addresses' mod='blockmyaccount'}"><i class="icon icon-fixed-width icon-no-decoration icon-chevron-right"></i>{l s='My addresses' mod='blockmyaccount'}</a>
			</li>
			<li>
				<a href="{$link->getPageLink('identity', true)}" title="{l s='My personal info' mod='blockmyaccount'}"><i class="icon icon-fixed-width icon-no-decoration icon-chevron-right"></i>{l s='My personal info' mod='blockmyaccount'}</a>
			</li>
			{if $voucherAllowed}
			<li>
				<a href="{$link->getPageLink('discount', true)}" title="{l s='My vouchers' mod='blockmyaccount'}"><i class="icon icon-fixed-width icon-no-decoration icon-chevron-right"></i>{l s='My vouchers' mod='blockmyaccount'}</a>
				</li>
			{/if}
			{$HOOK_BLOCK_MY_ACCOUNT}
		</ul>
		<p class="logout"><a href="{$link->getPageLink('index', true, NULL, "mylogout")}" title="{l s='Sign out' mod='blockmyaccount'}">{l s='Sign out' mod='blockmyaccount'}</a></p>
	</div>
</div>
<!-- /Block myaccount module -->
