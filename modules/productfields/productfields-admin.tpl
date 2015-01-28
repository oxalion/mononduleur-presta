<h4>{l s='Product Fields' mod='productfields'}</h4>
<div class="separation"></div>
<table>
    <tr>
        <td class="col-left">
            <label>{l s='Warranty:' mod='productfields'}</label>
        </td>
        <td>
            {include file="controllers/products/input_text_lang.tpl"
                languages=$languages
                input_name='warranty'
                input_value=$warranty}
            <p class="preference_description">{l s='informations about the warranty' mod='productfields'}. <!-- <strong>{l s='ie: something here as a hint'}</strong> --></p>
        </td>
    </tr>
    <tr>
        <td class="col-left">
            <label>{l s='Constructor link:' mod='productfields'}</label>
        </td>
        <td>
            {include file="controllers/products/input_text_lang.tpl"
                languages=$languages
                input_name='constlink'
                input_value=$constlink}
            <p class="preference_description">{l s='Link to the product\'s page of the constructor' mod='productfields'}. <!-- <strong>{l s='ie: something here as a hint'}</strong> --></p>
        </td>
    </tr>
</table>