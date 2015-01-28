<?php

/**
 * OVERRIDE de la classe Attachment
 *
 * @extends AttachmentCore
 * @package Core
 * @subpackage Attachment
 * @category classes
 *
 * @author Guillaume C. <ovaxio@gmail.com>
 * @since 2013-10-08
 * @version  0.1.0
 *
 * CHANGELOG
 *
 * version  0.1.0 - 2013-08-10
 * - modification $definition : fields.name.size a 255
 */
class Attachment extends AttachmentCore
{


	/**
	 * @see ObjectModel::$definition
	 */
	public static $definition = array(
		'table' => 'attachment',
		'primary' => 'id_attachment',
		'multilang' => true,
		'fields' => array(
			'file' => 			array('type' => self::TYPE_STRING, 'validate' => 'isGenericName', 'required' => true, 'size' => 40),
			'mime' => 			array('type' => self::TYPE_STRING, 'validate' => 'isCleanHtml', 'required' => true, 'size' => 128),
			'file_name' => 		array('type' => self::TYPE_STRING, 'validate' => 'isGenericName', 'size' => 128),

			// Lang fields
			'name' => 			array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isGenericName', 'required' => true, 'size' => 255),
			'description' => 	array('type' => self::TYPE_STRING, 'lang' => true, 'validate' => 'isCleanHtml'),
		),
	);
}

