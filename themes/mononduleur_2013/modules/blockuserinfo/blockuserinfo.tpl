<!-- Block user information module HEADER -->
<div id="header_user">
	<ul id="header_nav">
		{if !$PS_CATALOG_MODE}
		<li id="shopping_cart">
			<a href="{$link->getPageLink($order_process, true)}" title="{l s='View my shopping cart' mod='blockuserinfo'}" rel="nofollow"><i class="icon-2x icon-fixed-width icon-no-decoration icon-shoppingcartalt"></i>{l s='Cart' mod='blockuserinfo'}
			<span class="ajax_cart_quantity{if $cart_qties == 0} hidden{/if}">{$cart_qties}</span>
			<span class="ajax_cart_product_txt{if $cart_qties != 1} hidden{/if}">{l s='Product' mod='blockuserinfo'}</span>
			<span class="ajax_cart_product_txt_s{if $cart_qties < 2} hidden{/if}">{l s='Products' mod='blockuserinfo'}</span>
			<span class="ajax_cart_total{if $cart_qties == 0} hidden{/if}">
				{if $cart_qties > 0}
					{if $priceDisplay == 1}
						{assign var='blockuser_cart_flag' value='Cart::BOTH_WITHOUT_SHIPPING'|constant}
						{convertPrice price=$cart->getOrderTotal(false, $blockuser_cart_flag)}
					{else}
						{assign var='blockuser_cart_flag' value='Cart::BOTH_WITHOUT_SHIPPING'|constant}
						{convertPrice price=$cart->getOrderTotal(true, $blockuser_cart_flag)}
					{/if}
				{/if}
			</span>
			<span class="ajax_cart_no_product{if $cart_qties > 0} hidden{/if}">{l s='(empty)' mod='blockuserinfo'}</span>
			</a>
		</li>
		{/if}
		<li id="your_account"><a href="{$link->getPageLink('my-account', true)}" title="{l s='View my customer account' mod='blockuserinfo'}" rel="nofollow"><i class="icon-fixed-width icon-no-decoration icon-user"></i>{l s='Your Account' mod='blockuserinfo'}</a></li>
	</ul>
	<p id="header_user_info">
		{l s='Welcome' mod='blockuserinfo'}
		{if $logged}
			<a href="{$link->getPageLink('my-account', true)}" title="{l s='View my customer account' mod='blockuserinfo'}" class="account" rel="nofollow"><span>{$cookie->customer_firstname} {$cookie->customer_lastname}</span></a>
			<a href="{$link->getPageLink('index', true, NULL, "mylogout")}" title="{l s='Log me out' mod='blockuserinfo'}" class="logout" rel="nofollow">
				<i class="icon-fixed-width icon-no-decoration icon-off"></i>{l s='Log out' mod='blockuserinfo'}
			</a>
		{else}
			<a href="{$link->getPageLink('my-account', true)}" title="{l s='Login to your customer account' mod='blockuserinfo'}" class="login" rel="nofollow">
				<i class="icon-fixed-width icon-no-decoration icon-user"></i>{l s='Login' mod='blockuserinfo'}
			</a>
		{/if}
	</p>
</div>
<!-- /Block user information module HEADER -->
