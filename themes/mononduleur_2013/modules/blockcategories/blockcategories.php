<?php
/**
 * OVERRIDE du module BlockCategories
 *  Utilisation de l override de la classe Module.php
 *
 * @extends Module
 * @package Theme Mononduleur 2013
 * @subpackage Module Blockcategories
 * @category classes
 *
 * @author Guillaume C. <ovaxio@gmail.com>
 * @since 2013-07-24
 * @version  0.1.0
 *
 * CHANGELOG
 *
 * version  0.1.0 - 2013-07-24
 * - modification hookFooter
 */

class BlockCategoriesTheme extends BlockCategories
{

	public function hookFooter($params)
	{
		// Get all groups for this customer and concatenate them as a string: "1,2,3..."
		if (!$this->isCached('blockcategories_footer.tpl', $this->getCacheId()))
		{

/****************************************************/
/* 			OVERRIDE POUR LE THEME 	2013-07-24		*/
/****************************************************/
			$maxdepth = 2;//Configuration::get('BLOCK_CATEG_MAX_DEPTH');
/****************************************************/

			$groups = implode(', ', Customer::getGroupsStatic((int)$this->context->customer->id));
			if (!$result = Db::getInstance(_PS_USE_SQL_SLAVE_)->executeS('
				SELECT DISTINCT c.id_parent, c.id_category, cl.name, cl.description, cl.link_rewrite
				FROM `'._DB_PREFIX_.'category` c
				'.Shop::addSqlAssociation('category', 'c').'
				LEFT JOIN `'._DB_PREFIX_.'category_lang` cl ON (c.`id_category` = cl.`id_category` AND cl.`id_lang` = '.(int)$this->context->language->id.Shop::addSqlRestrictionOnLang('cl').')
				LEFT JOIN `'._DB_PREFIX_.'category_group` cg ON (cg.`id_category` = c.`id_category`)
				WHERE (c.`active` = 1 OR c.`id_category` = 1)
				'.((int)($maxdepth) != 0 ? ' AND `level_depth` <= '.(int)($maxdepth) : '').'
				AND cg.`id_group` IN ('.pSQL($groups).')
				ORDER BY `level_depth` ASC, '.(Configuration::get('BLOCK_CATEG_SORT') ? 'cl.`name`' : 'category_shop.`position`').' '.(Configuration::get('BLOCK_CATEG_SORT_WAY') ? 'DESC' : 'ASC')))
				return;
			$resultParents = array();
			$resultIds = array();

			foreach ($result as &$row)
			{
				$resultParents[$row['id_parent']][] = &$row;
				$resultIds[$row['id_category']] = &$row;
			}
			//$nbrColumns = Configuration::get('BLOCK_CATEG_NBR_COLUMNS_FOOTER');
			$nbrColumns = Configuration::get('BLOCK_CATEG_NBR_COLUMN_FOOTER');
			if (!$nbrColumns)
				$nbrColumns = 3;
			$numberColumn = abs(count($result) / $nbrColumns);
			$widthColumn = floor(100 / $nbrColumns);
			$this->smarty->assign('numberColumn', $numberColumn);
			$this->smarty->assign('widthColumn', $widthColumn);

			$blockCategTree = $this->getTree($resultParents, $resultIds, Configuration::get('BLOCK_CATEG_MAX_DEPTH'));
			unset($resultParents, $resultIds);

			$isDhtml = false;//(Configuration::get('BLOCK_CATEG_DHTML') == 1 ? true : false);

			$id_category = (int)Tools::getValue('id_category');
			$id_product = (int)Tools::getValue('id_product');

			if (Tools::isSubmit('id_category'))
			{
				$this->context->cookie->last_visited_category = $id_category;
				$this->smarty->assign('currentCategoryId', $this->context->cookie->last_visited_category);
			}
			if (Tools::isSubmit('id_product'))
			{
				if (!isset($this->context->cookie->last_visited_category) || !Product::idIsOnCategoryId($id_product, array('0' => array('id_category' => $this->context->cookie->last_visited_category))))
				{
					$product = new Product($id_product);
					if (isset($product) && Validate::isLoadedObject($product))
						$this->context->cookie->last_visited_category = (int)($product->id_category_default);
				}
				$this->smarty->assign('currentCategoryId', (int)($this->context->cookie->last_visited_category));
			}
			$this->smarty->assign('blockCategTree', $blockCategTree);

			if (file_exists(_PS_THEME_DIR_.'modules/blockcategories/blockcategories_footer.tpl'))
				$this->smarty->assign('branche_tpl_path', _PS_THEME_DIR_.'modules/blockcategories/category-tree-branch.tpl');
			else
				$this->smarty->assign('branche_tpl_path', _PS_MODULE_DIR_.'blockcategories/category-tree-branch.tpl');
			$this->smarty->assign('isDhtml', $isDhtml);
		}
		$display = $this->display(__FILE__, 'blockcategories_footer.tpl', $this->getCacheId());

		return $display;
	}
}
