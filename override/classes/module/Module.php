<?php
/*
* 2011-2012 davask web limited
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to contact@davaskweblimited.com so we can send you a copy immediately.
*
*  @author davask.42 <contact@davaskweblimited.com>
*  @copyright  2011-2012 davask web limited
*  @version  Release: $Revision: 0001 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of davask web limited
*/

abstract class Module extends ModuleCore
{
  /*********************************************************
   * Override of Module Core                               *
   * Use this override to override (^^) module classes     *
   *                                                       *
   * source : https://gist.github.com/2287709              *
   * FILES INVOLVED :                                      *
   * - root/override/classes/Module.php                    *
   *                                                       *
   * @version 1.0.0                                        *
   * @author Julien BREUX <julien.breux@prestashop.com>    *
   *                                                       *
   * Return an instance of the specified module            *
   *                                                       *
   * @param string $module_name Module name                *
   * @return Module                                        *
   *                                                       */
  public static function getInstanceByName($module_name) {

    if (!Validate::isModuleName($module_name))
    {
      if (_PS_MODE_DEV_)
        die(Tools::displayError($module_name.' is not a valid module name.'));
      return false;
    }

    if (!isset(self::$_INSTANCE[$module_name]))
    {
      if (Tools::file_exists_cache(_PS_MODULE_DIR_.$module_name.'/'.$module_name.'.php'))
      {
        include_once(_PS_MODULE_DIR_.$module_name.'/'.$module_name.'.php');

        $override_module_file = _PS_ROOT_DIR_.'/override/modules/'.$module_name.'/'.$module_name.'.php';
        $override_theme_module_file = _PS_THEME_DIR_.'modules/'.$module_name.'/'.$module_name.'.php';

        if (file_exists($override_module_file))
        {
          require_once $override_module_file;
          $module_name .= '_Overrided';
        } elseif (file_exists($override_theme_module_file)) {
          require_once $override_theme_module_file;
          $module_name .= 'Theme';
        }

        if (class_exists($module_name, false))
          return self::$_INSTANCE[$module_name] = new $module_name;
      }
      return false;
    }
    return self::$_INSTANCE[$module_name];
  } // END METHOD
  /*                                                        *
   * /Override of Module Core                               *
   *********************************************************/

}