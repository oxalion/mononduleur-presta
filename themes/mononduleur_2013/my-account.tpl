
{capture name=path}{l s='My account'}{/capture}
{include file="$tpl_dir./breadcrumb.tpl"}

<h1>{l s='My account'}</h1>
{if isset($account_created)}
	<p class="success">
		{l s='Your account has been created.'}
	</p>
{/if}
<div class="my-ac-wrap">
	<p class="title_block">{l s='Welcome to your account. Here you can manage al of your personal information and orders. '}</p>
	<ul class="myaccount_lnk_list">
		{if $has_customer_an_address}
		<li><a href="{$link->getPageLink('address', true)}" title="{l s='Add my first address'}"><!-- <img src="{$img_dir}icon/addrbook.gif" alt="{l s='Add my first address'}" class="icon" /> --><i class="icon-2x icon-fixed-width icon-no-decoration icon-address pull-left"></i>
			{l s='Add my first address'}</a></li>
		{/if}
		<li><a href="{$link->getPageLink('history', true)}" title="{l s='Orders'}"><!-- <img src="{$img_dir}icon/order.gif" alt="{l s='Orders'}" class="icon" />  -->
			<i class="icon-2x icon-fixed-width icon-no-decoration icon-invoice pull-left"></i>{l s='Order history and details '}</a></li>
		{if $returnAllowed}
			<li><a href="{$link->getPageLink('order-follow', true)}" title="{l s='Merchandise returns'}"><!-- <img src="{$img_dir}icon/return.gif" alt="{l s='Merchandise returns'}" class="icon" /> --> 
				<i class="icon-2x icon-fixed-width icon-no-decoration icon-address pull-left"></i>{l s='My merchandise returns'}</a></li>
		{/if}
		<li><a href="{$link->getPageLink('order-slip', true)}" title="{l s='Credit slips'}"><!-- <img src="{$img_dir}icon/slip.gif" alt="{l s='Credit slips'}" class="icon" /> --> <i class="icon-2x icon-fixed-width icon-no-decoration icon-wallet pull-left"></i>{l s='My credit slips'}</a></li>
		<li><a href="{$link->getPageLink('addresses', true)}" title="{l s='Addresses'}"><!-- <img src="{$img_dir}icon/addrbook.gif" alt="{l s='Addresses'}" class="icon" /> --> <i class="icon-2x icon-fixed-width icon-no-decoration icon-address pull-left"></i>{l s='My addresses'}</a></li>
		<li><a href="{$link->getPageLink('identity', true)}" title="{l s='Information'}"><!-- <img src="{$img_dir}icon/userinfo.gif" alt="{l s='Information'}" class="icon" /> --> <i class="icon-2x icon-fixed-width icon-no-decoration icon-user pull-left"></i>{l s='My personal information'}</a></li>
		{if $voucherAllowed}
			<li><a href="{$link->getPageLink('discount', true)}" title="{l s='Vouchers'}"><!-- <img src="{$img_dir}icon/voucher.gif" alt="{l s='Vouchers'}" class="icon" /> --> <i class="icon-2x icon-fixed-width icon-no-decoration icon-coupon pull-left"></i>{l s='My vouchers'}</a></li>
		{/if}
		{$HOOK_CUSTOMER_ACCOUNT}
	</ul>
</div>
<p><a href="{$base_dir}" title="{l s='Home'}"><img src="{$img_dir}icon/home.gif" alt="{l s='Home'}" class="icon" /></a><a href="{$base_dir}" title="{l s='Home'}">{l s='Home'}</a></p>
