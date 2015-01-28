<?php
/**
 *
 */
if (!defined('_PS_VERSION_'))
    exit;

class ProductFields extends Module
{
    public function __construct()
    {
        $this->name = 'productfields';
        $this->tab = 'administration';
        $this->version = '1.0';
        $this->author = 'Guillaume Chambard';
        $this->need_instance = 0;
        $this->ps_versions_compliancy = array('min' => '1.5', 'max' => '1.6');
        $this->dependencies = array();

        parent::__construct();

        $this->displayName = $this->l('Product Fields');
        $this->description = $this->l('Add fields to put more information about the product.');
        $this->confirmUninstall = $this->l('Are you sure you want to uninstall the module Product Fields?');
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
           !$this->registerHook('displayHeader') OR
           !$this->registerHook('productMoreInfoTab'))
            return false;

        return true;
    }

    public function uninstall()
    {
        if (!parent::uninstall() OR !$this->alterTable('remove'))
            return false;
        return true;
    }

    /**
     * Ajout / suppression des colonnes
     * @param  string $method ADD/REMOVE
     * @return bool         [description]
     */
    public function alterTable($method)
    {
        switch ($method) {
            case 'add':
                $sql  = 'ALTER TABLE ' . _DB_PREFIX_ . 'product_lang ADD COLUMN `warranty` VARCHAR(128) NOT NULL, ADD COLUMN `constlink` VARCHAR(255) NOT NULL';
                break;

            case 'remove':
                $sql  = 'ALTER TABLE ' . _DB_PREFIX_ . 'product_lang DROP COLUMN `warranty`, DROP COLUMN `constlink`';
                break;
        }

        if(!Db::getInstance()->Execute($sql))
            return false;
        return true;
    }

    /**
     * creation des variables SMARTY pour le tab dans l admin
     */
    public function prepareNewTab()
    {
        $id_product = (int)Tools::getValue('id_product');
        $this->context->smarty->assign(array(
            'warranty'         => $this->getWarranty($id_product),
            'constlink'        => $this->getConstructorLink($id_product),
            'languages'        => $this->context->controller->_languages,
            'default_language' => (int)Configuration::get('PS_LANG_DEFAULT')
        ));
    }

    /**
     * recuperer le champ de garantie
     */
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

    /**
     * recuperer le champ constructor link
     */
    public function getConstructorLink($id_product)
    {
        $result = Db::getInstance()->ExecuteS('SELECT constlink, id_lang FROM '._DB_PREFIX_.'product_lang WHERE id_product = ' . (int)$id_product);
        if(!$result)
            return array();

        foreach ($result as $field) {
            $fields[$field['id_lang']] = $field['constlink'];
        }

        return $fields;
    }

    public function hookDisplayAdminProductsExtra($params)
    {
        if (Validate::isLoadedObject($product = new Product((int)Tools::getValue('id_product')))) {
            $this->prepareNewTab();
            return $this->display(__FILE__, 'productfields-admin.tpl');
        }
    }

    /**
     * Update des valeurs pour la garantie lors du hook ActionProductUpdate
     */
    public function hookActionProductUpdate($params)
    {
        // get all languages
        // for each of them, store the new field
        $id_product = (int)Tools::getValue('id_product');
        $languages = Language::getLanguages(true);

        foreach ($languages as $lang) {
            if(!Db::getInstance()->update('product_lang',
                                            array('warranty'  => pSQL(Tools::getValue('warranty_'.$lang['id_lang'])),
                                                  'constlink' => pSQL(Tools::getValue('constlink_'.$lang['id_lang']))
                                            ),
                                            'id_lang = ' . $lang['id_lang'] .' AND id_product = ' .$id_product
                                        )
            )
                $this->context->controller->_errors[] = Tools::displayError('Error: ').mysql_error();
        }
    }

    /**
     * Ajout du JS dans le template
     */
    public function hookActionAdminControllerSetMedia($params)
    {
        // add necessary javascript to products back office
        if($this->context->controller->controller_name == 'AdminProducts' && Tools::getValue('id_product')) {
            $this->context->controller->addJS($this->_path.'/js/productfields.js');
        }
    }

    /**
     * Appel du hook ProductExtraLeft
     * - affichage de la garantie
     */
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

    /**
     * Appel du hook ProductExtraLeft
     * - affichage de la garantie
     */
    public function hookProductMoreInfoTab($params)
    {
        if (Validate::isLoadedObject($product = new Product((int)Tools::getValue('id_product')))) {
            $result = Db::getInstance()->getValue('SELECT constlink FROM '._DB_PREFIX_.'product_lang WHERE id_product = ' . (int)Tools::getValue('id_product') . ' AND id_lang = ' . (int)$this->context->language->id);
            if($result){
                $this->context->smarty->assign(array(
                    'constlink' => $result
                ));
            }
            return $this->display(__FILE__, 'productconstlink.tpl');
        }
    }

    /**
     * Ajout du CSS dans le template
     */
    public function hookDisplayHeader()
    {
        $this->context->controller->addCSS($this->_path.'css/productfields.css', 'all');
    }
}
?>