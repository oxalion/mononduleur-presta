<?php
/**
 * OVERRIDE du module BlockTags
 *  Utilisation de l override de la classe Module.php
 *
 * @extends Module
 * @package Theme Mononduleur 2013
 * @subpackage Module BlockTags
 * @category classes
 *
 * @author Guillaume C. <ovaxio@gmail.com>
 * @since 2013-07-25
 * @version  0.1.0
 *
 * CHANGELOG
 *
 * version  0.1.0 - 2013-07-25
 * - ajout hookFooter
 */

class BlockTagsTheme extends BlockTags
{
	function hookFooter($params)
	{
		return $this->hookLeftColumn($params);
	}
}
