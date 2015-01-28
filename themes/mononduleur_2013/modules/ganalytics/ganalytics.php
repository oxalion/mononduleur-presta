<?php

class GAnalyticsTheme extends GAnalytics
{	
	

	function hookOrderConfirmation($params)
	{
		// Setting parameters
		$parameters = Configuration::getMultiple(array('PS_LANG_DEFAULT'));
		
		$order = $params['objOrder'];
		if (Validate::isLoadedObject($order))
		{
			$deliveryAddress = new Address(intval($order->id_address_delivery));

			$conversion_rate = 1;
			if ($order->id_currency != Configuration::get('PS_CURRENCY_DEFAULT'))
			{
				$currency = new Currency(intval($order->id_currency));
				$conversion_rate = floatval($currency->conversion_rate);
			}

			// Order general information
			$trans = array(
				'id' => intval($order->id),				// order ID - required
						'store' => htmlentities(Configuration::get('PS_SHOP_NAME')), // affiliation or store name
						'total' => Tools::ps_round(floatval($order->total_paid) / floatval($conversion_rate), 2),		// total - required
						'tax' => '0', // tax
						'shipping' => Tools::ps_round(floatval($order->total_shipping) / floatval($conversion_rate), 2),	// shipping
						'city' => addslashes($deliveryAddress->city),		// city
						'state' => '',				// state or province
						'country' => addslashes($deliveryAddress->country) // country
						);

			// Product information
			$products = $order->getProducts();
			foreach ($products AS $product)
			{
				$category = Db::getInstance()->getRow('
								SELECT name FROM `'._DB_PREFIX_.'category_lang` , '._DB_PREFIX_.'product 
								WHERE `id_product` = '.intval($product['product_id']).' AND `id_category_default` = `id_category` 
								AND `id_lang` = '.intval($parameters['PS_LANG_DEFAULT']));
				
				$items[] = array(
					'OrderId' => intval($order->id),								// order ID - required
								'SKU' => addslashes($product['product_id']),		// SKU/code - required
								'Product' => addslashes($product['product_name']),		// product name
								'Category' => addslashes($category['name']),			// category or variation
								'Price' => Tools::ps_round(floatval($product['product_price_wt']) / floatval($conversion_rate), 2),	// unit price - required
								'Quantity' => addslashes(intval($product['product_quantity']))	//quantity - required
								);
			}
			$ganalytics_id = Configuration::get('GANALYTICS_ID');

			$this->context->smarty->assign('items', $items);
			$this->context->smarty->assign('trans', $trans);
			$this->context->smarty->assign('ganalytics_id', $ganalytics_id);
			/****************************************************/
			/* 			OVERRIDE POUR LE THEME 	2013-07-24		*/
			/****************************************************/
			$this->context->smarty->assign('pageTrack', 'order-confirmation.php');// Ajout pour le tunnel de conversion de commande
			/****************************************************/
			$this->context->smarty->assign('isOrder', true);
			return $this->display(__FILE__, 'header.tpl');
		}
	}
}
