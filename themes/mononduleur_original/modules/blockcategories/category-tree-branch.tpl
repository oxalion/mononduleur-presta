<li {if $last == 'true'}class="last"{/if}>
	<a class="{if $isDhtml && $node.id != $currentCategoryId && ($node.id == 89 || $node.id == 90 || $node.id == 91|| $node.id == 92 || $node.id == 93)}btn{/if}" href="{$node.link|escape:html:'UTF-8'}" {if $node.id == $currentCategoryId}class="selected"{/if} title="{$node.name|escape:html:'UTF-8'}">{$node.name|escape:html:'UTF-8'}</a>
	{if $node.children|@count > 0}
		<ul class="{if $isDhtml && $node.id != $currentCategoryId && ($node.id == 89 || $node.id == 90 || $node.id == 91|| $node.id == 92 || $node.id == 93)}dhtml{/if}">
		{foreach from=$node.children item=child name=categoryTreeBranch}
			{if $smarty.foreach.categoryTreeBranch.last}
						{include file=$branche_tpl_path node=$child last='true'}
			{else}
						{include file=$branche_tpl_path node=$child last='false'}
			{/if}
		{/foreach}
		</ul>
	{/if}
</li>
