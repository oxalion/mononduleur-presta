<?php
/**
 *
 */
if (!defined('_PS_VERSION_'))
    exit;

class ProductWarranty extends Module
{
    public function __construct()
    {
        $this->name = 'productwarranty';
        $this->tab = 'administration';
        $this->version = '1.0';
        $this->author = 'Guillaume Chambard';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.5', 'max' => '1.6');
        $this->dependencies = array();

        parent::__construct();

        $this->displayName = $this->l('Product Warranty');
        $this->description = $this->l('Add a field to put the current warranty of the product.');
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall the module Product Warranty?');
    }

    public function install()
    {
        if (Shop::isFeatureActive())
            Shop::setContext(Shop::CONTEXT_ALL);

       if (!parent::install() OR
           !$this->alterTable('add') OR
           !$this->registerHook('actionAdminControllerSetMedia') OR
           !$this->registerHook('actionProductUpdate') OR
           !$this->registerHook('displayAdminProductsExtra') OR
           !$this->registerHook('productExtraLeft') OR
           !$this->registerHook('displayHeader'))
            return false;

        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall() OR !$this->alterTable('remove'))
            return false;
        return true;
    }

    public function alterTable($method)
    {
        switch ($method) {
            case 'add':
                $sql = 'ALTER TABLE ' . _DB_PREFIX_ . 'product_lang ADD `warranty` VARCHAR(128) NOT NULL';
                break;

            case 'remove':
                $sql = 'ALTER TABLE ' . _DB_PREFIX_ . 'product_lang DROP COLUMN `warranty`';
                break;
        }

        if(!Db::getInstance()->Execute($sql))
            return false;
        return true;
    }


    public function prepareNewTab()
    {
        $this->context->smarty->assign(array(
            'warranty' => $this->getWarranty((int)Tools::getValue('id_product')),
            'languages' => $this->context->controller->_languages,
            'default_language' => (int)Configuration::get('PS_LANG_DEFAULT')
        ));
    }

    public function getWarranty($id_product)
    {
        $result = Db::getInstance()->ExecuteS('SELECT warranty, id_lang FROM '._DB_PREFIX_.'product_lang WHERE id_product = ' . (int)$id_product);
        if(!$result)
            return array();

        foreach ($result as $field) {
            $fields[$field['id_lang']] = $field['warranty'];
        }

        return $fields;
    }

    public function hookDisplayAdminProductsExtra($params)
    {
        if (Validate::isLoadedObject($product = new Product((int)Tools::getValue('id_product')))) {
            $this->prepareNewTab();
            return $this->display(__FILE__, 'productwarranty-admin.tpl');
        }
    }

    public function hookActionProductUpdate($params)
    {
        // get all languages
        // for each of them, store the new field
        $id_product = (int)Tools::getValue('id_product');
        $languages = Language::getLanguages(true);
        foreach ($languages as $lang) {
            if(!Db::getInstance()->update('product_lang', array('warranty'=> pSQL(Tools::getValue('warranty_'.$lang['id_lang']))) ,'id_lang = ' . $lang['id_lang'] .' AND id_product = ' .$id_product ))
                $this->context->controller->_errors[] = Tools::displayError('Error: ').mysql_error();
        }
    }

    public function hookActionAdminControllerSetMedia($params)
    {
        // add necessary javascript to products back office
        if($this->context->controller->controller_name == 'AdminProducts' && Tools::getValue('id_product')) {
            $this->context->controller->addJS($this->_path.'/js/productwarranty.js');
        }
    }

    public function hookProductExtraLeft($params)
    {
        if (Validate::isLoadedObject($product = new Product((int)Tools::getValue('id_product')))) {


            $result = Db::getInstance()->getValue('SELECT warranty FROM '._DB_PREFIX_.'product_lang WHERE id_product = ' . (int)Tools::getValue('id_product') . ' AND id_lang = ' . (int)$this->context->language->id);
            if($result){
                $this->context->smarty->assign(array(
                    'warranty' => $result
                ));
            }
            return $this->display(__FILE__, 'productwarranty.tpl');
        }
    }

    public function hookDisplayHeader()
    {
        $this->context->controller->addCSS($this->_path.'css/productwarranty.css', 'all');
    }
}
?>