<h4>{l s='Warranty' mod='productwarranty'}</h4>
<div class="separation"></div>
<table>
    <tr>
        <td class="col-left">
            <label>{l s='Warranty:' mod='productwarranty'}</label>
        </td>
        <td>
            {include file="controllers/products/input_text_lang.tpl"
                languages=$languages
                input_name='warranty'
                input_value=$warranty}
            <p class="preference_description">{l s='informations about the warranty' mod='productwarranty'}. <!-- <strong>{l s='ie: something here as a hint'}</strong> --></p>
        </td>
    </tr>
</table>