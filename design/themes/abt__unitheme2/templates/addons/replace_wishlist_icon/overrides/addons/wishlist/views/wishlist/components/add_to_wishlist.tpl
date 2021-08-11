<a class="ut2-add-to-wish {if $details_page}label {/if}{if $but_name}cm-submit {/if}{if !$runtime.customization_mode.live_editor}cm-tooltip{/if}"{if $but_id} title="{__("abt__ut2.add_to_wishlist.tooltip")}" id="{$but_id}"{/if}{if $but_name} data-ca-dispatch="{$but_name}"{/if}{if $but_href} href="{$but_href|fn_url}"{/if} rel="nofollow">
<div class="inline-icon__icon-set" id="in_wishlist_{$product.product_id}">

{if !fn_check_product_in_wishlist($product.product_id)}
	{if !$ee_flag_first && ($runtime.controller == 'categories' && $runtime.mode == 'view') || ($runtime.controller == 'index' && $runtime.mode == 'index') || ($runtime.controller == 'products' && $runtime.mode == 'search')}
		<style>
		.wlst.ut2-icon.ut2-icon-baseline-favorite-border1:before {
			font-size: 17px;
		}
		</style>
	{assign "ee_flag_first" "1" scope="root"}
	{/if}
<div class="wlst ut2-icon ut2-icon-baseline-favorite-border1" style="font-size: 0px; bottom: 5px; position: relative;"></div>
{*<svg class="inline-icon__icon__product" xmlns:xlink="http://www.w3.org/1999/xlink">
<use xlink:href="#icon-favorite-border">
    <svg id="icon-favorite-border" viewBox="0 0 22 20">
        <path d="M10.8464,20 C-10.3206,8.09932 4.99918,-6.68638 10.8464,3.29096 C16.6937,-6.68638 32.0135,8.09932 10.8464,20 Z M20.0775428,3.87864284 C18.3126782,0.25040019 14.0086125,-0.127018304 11.709154,3.79658389 L10.8463941,5.2687247 L9.98364297,3.79657875 C7.68421987,-0.12701677 3.38018649,0.250401149 1.61532489,3.87864238 C-0.45394124,8.13268511 2.35562324,13.9196094 10.8464012,18.8483598 C19.3372232,13.919608 22.1468101,8.13268234 20.0775428,3.87864284 Z"></path>
    </svg>
</use>
</svg>*}

{else}

<div class="wlst ut2-icon ut2-icon-baseline-favorite1"></div>
   {* <svg class="inline-icon__icon__product inline-icon__icon__product__in-wishlist" onmouseover="fn_onmouseover(event);" xmlns:xlink="http://www.w3.org/1999/xlink">
    <use xlink:href="#icon-favorite">
        <svg id="icon-favorite" viewBox="0 0 22 20">
            <path d="M10.8464,20 C-10.3206,8.09932 4.99918,-6.68638 10.8464,3.29096 C16.6937,-6.68638 32.0135,8.09932 10.8464,20 Z"></path>
        </svg>
    </use>
    </svg>*}
    
    {*<div class="inline-icon__icon__product__in-wishlist_out" style="display: none;" onmouseout="fn_onmouseout(event);">*}
   {* <svg class="inline-icon__icon__product" xmlns:xlink="http://www.w3.org/1999/xlink" style="display: none;" onmouseout="fn_onmouseout(event);">
    <use xlink:href="#icon-br-favorite">
        <svg id="icon-br-favorite" viewBox="0 0 24 20">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M10.8464 20C-10.3206 8.09932 4.99918 -6.68638 10.8464 3.29096L7.5 10L12.8465 12.2914L10.8464 20Z" fill="#FF7180"></path>
            <path fill-rule="evenodd" clip-rule="evenodd" d="M12.8465 20L14.8464 11L10 9L12.8465 3.29096C18.6937 -6.68638 34.0135 8.09932 12.8465 20Z" fill="#FF7180"></path>
        </svg>
    </use>
    </svg>*}
    {*</div>*}

{/if}
<!--in_wishlist_{$product.product_id}--></div>
{if $details_page}{__("add_to_wishlist")}{/if}</a>

