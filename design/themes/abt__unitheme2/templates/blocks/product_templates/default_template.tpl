{script src="js/tygh/exceptions.js"}

{$is_add_to_cart_mv=true}
{if "MULTIVENDOR"|fn_allowed_for && ($product.master_product_id || !$product.company_id)}{$is_add_to_cart_mv=false}{/if}

<div class="ut2-pb ty-product-block ty-product-detail {if $settings.abt__ut2.products.view.show_sticky_add_to_cart[$settings.abt__device] == 'Y' && !in_array($product.zero_price_action, ["P","A"]) && $product.price > 0 && $product.amount > 0 && $is_add_to_cart_mv}sticky_add_to_cart{/if}">


	{include file="common/breadcrumbs.tpl"}
	
	<div class="ut2-pb__wrapper clearfix">
		
    {hook name="products:view_main_info"}
        {if $product}
            {assign var="obj_id" value=$product.product_id}
            {include file="common/product_data.tpl" product=$product but_role="big" but_text=__("add_to_cart") product_labels_position="left-top"}
            
            <div class="ut2-pb__img-wrapper ty-product-block__img-wrapper">
                {hook name="products:image_wrap"}
                    {if !$no_images}

                        <div class="ut2-pb__img cm-reload-{$product.product_id}" id="product_images_{$product.product_id}_update">
							
							{if !$addons.ab__video_gallery}
                            {assign var="product_labels" value="product_labels_`$obj_prefix``$obj_id`"}
                            {$smarty.capture.$product_labels nofilter}
                            {/if}

                            {include file="views/products/components/product_images.tpl" product=$product show_detailed_link="Y" image_width=$settings.Thumbnails.product_details_thumbnail_width image_height=$settings.Thumbnails.product_details_thumbnail_height}
                        <!--product_images_{$product.product_id}_update--></div>
                    {/if}
                {/hook}

                {hook name="products:bottom_product_layer"}{/hook}

            </div>
            <div class="ut2-pb__right">
            
                {if $settings.abt__ut2.products.view.show_features[$settings.abt__device] == 'Y'}
    	                {hook name="products:brand"}
		                    {hook name="products:brand_default"}
		                        <div class="brand">
		                            {include file="views/products/components/product_features_short_list.tpl" features=$product.header_features}
		                        </div>
		                    {/hook}
		                {/hook}
		                {/if}
            
                {* {hook name="products:main_info_title"} *}
        {if !$hide_title}
            <h1 class="ut2-pb__title" {live_edit name="product:product:{$product.product_id}"}><bdi>{$product.product nofilter}</bdi></h1>
        {/if}
	{* {/hook} *}
            
                {assign var="form_open" value="form_open_`$obj_id`"}
                {$smarty.capture.$form_open nofilter}

                {assign var="old_price" value="old_price_`$obj_id`"}
                {assign var="price" value="price_`$obj_id`"}
                {assign var="clean_price" value="clean_price_`$obj_id`"}
                {assign var="list_discount" value="list_discount_`$obj_id`"}
                {assign var="discount_label" value="discount_label_`$obj_id`"}
                       
           
				
				<div class="cols-wrap">
					
					{hook name="products:ab__deal_of_the_day_product_view"}{/hook}
					
					<div class="col-left ddt">{* Start col *}
					
	                    <div class="{if $smarty.capture.$old_price|trim || $smarty.capture.$clean_price|trim || $smarty.capture.$list_discount|trim}prices-container {/if}price-wrap">
	                        {if $smarty.capture.$old_price|trim || $smarty.capture.$clean_price|trim || $smarty.capture.$list_discount|trim}
	                        <div class="ty-product-prices">
	                            {if $smarty.capture.$old_price|trim}{$smarty.capture.$old_price nofilter}{/if}
	                            {/if}
	
	                            {if $smarty.capture.$price|trim}
	                                <div class="ut2-pb__price-actual">
	                                    {$smarty.capture.$price nofilter}
	                                </div>
	                            {/if}
	
	                            {if $smarty.capture.$old_price|trim || $smarty.capture.$clean_price|trim || $smarty.capture.$list_discount|trim}
	                            {$smarty.capture.$clean_price nofilter}
	                            {$smarty.capture.$list_discount nofilter}
	
	                            {if $product.prices}
	                                <div class="ut2__qty-discounts">{include file="views/products/components/products_qty_discounts.tpl"}</div>
	                            {/if}
	                        </div>
	                        {/if}
	                    </div>

		                {assign var="product_amount" value="product_amount_`$obj_id`"}
						{$smarty.capture.$product_amount nofilter}
		
		                {if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
		                <div class="ut2-pb__option">
		                    {assign var="product_options" value="product_options_`$obj_id`"}
		                    {$smarty.capture.$product_options nofilter}
		                </div>
		                {if $capture_options_vs_qty}{/capture}{/if}
		
		                <div class="ut2-pb__advanced-option clearfix">
		                    {if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
		                    {assign var="advanced_options" value="advanced_options_`$obj_id`"}
		                    {$smarty.capture.$advanced_options nofilter}
		                    {if $capture_options_vs_qty}{/capture}{/if}
		                </div>
	                
		                {assign var="product_edp" value="product_edp_`$obj_id`"}
		                {$smarty.capture.$product_edp nofilter}

		               
                        
                    </div>{* End col *}
					<div class="col-right u2">{* Start col *}
	                
	                	{hook name="products:ab__motivation_block"}{/hook}
	                
		                {if $settings.abt__ut2.products.custom_block_id|intval}
	                        {render_block block_id=$settings.abt__ut2.products.custom_block_id|intval dispatch="products.view"  use_cache=false parse_js=false}
	                    {/if}
	                    
						{* Remove if using hook in motivation block *}
	                    {hook name="products:geo_maps"}{/hook}


     {if $product.discussion_type && $product.discussion_type != 'D' || $show_sku == "true"}
                    <div class="top-product-layer">
                        
                        {assign var="rating" value="rating_`$obj_id`"}
                        {if $product.discussion_type && $product.discussion_type != 'D' && $product.discussion.posts && $product.discussion.search.total_items > 0}
                        <div class="ut2-pb__rating">
                            <div class="ty-discussion__rating-wrapper" id="average_rating_product">
                                {$smarty.capture.$rating nofilter}<a class="ty-discussion__review-a cm-external-click" data-ca-scroll="content_discussion" data-ca-external-click-id="discussion">{$product.discussion.search.total_items} {__("reviews", [$product.discussion.search.total_items])}</a>{if $discussion.type !== "Addons\\Discussion\\DiscussionTypes::TYPE_DISABLED"|enum && !$discussion.disable_adding}{include file="addons/discussion/views/discussion/components/new_post_button.tpl" name=__("write_review") obj_id=$obj_id obj_prefix="main_info_title_" style="text" object_type="Addons\\Discussion\\DiscussionObjectTypes::PRODUCT"|enum locate_to_review_tab=true}{/if}
                            </div>
                        </div>
                        {elseif $product.discussion_type && $product.discussion_type != 'D'}
                        <div class="ut2-pb__rating">
                            <div class="ty-discussion__rating-wrapper">
                                <span class="ty-nowrap no-rating"><i class="ty-icon-star-empty"></i><i class="ty-icon-star-empty"></i><i class="ty-icon-star-empty"></i><i class="ty-icon-star-empty"></i><i class="ty-icon-star-empty"></i></span>
                                {if $discussion.type !== "Addons\\Discussion\\DiscussionTypes::TYPE_DISABLED"|enum && !$discussion.disable_adding}{include file="addons/discussion/views/discussion/components/new_post_button.tpl" name=__("write_review") obj_id=$obj_id obj_prefix="main_info_title_" style="text" object_type="Addons\\Discussion\\DiscussionObjectTypes::PRODUCT"|enum locate_to_review_tab=true}{/if}
                            </div>
                        </div>
                        {/if}

                        
	                </div>
                {/if}

		            

		            
		                
		                {hook name="products:product_detail_bottom"}{/hook}
		                
	            	</div>{* End col *}
                    
                        {hook name="products:promo_text"}
    	                {if $product.promo_text}
		                    <div class="ut2-pb__note">
		                        {$product.promo_text nofilter}
		                    </div>
		                {/if}
		                {/hook}
                    
                    <div class="btblk">
                        
                         {if $capture_options_vs_qty}{capture name="product_options"}{$smarty.capture.product_options nofilter}{/if}
    	                <div class="ut2-qty__wrap {if $min_qty && $product.min_qty}min-qty{/if} ut2-pb__field-group">
		                    {assign var="qty" value="qty_`$obj_id`"}
		                    {$smarty.capture.$qty nofilter}
		
		                    {assign var="min_qty" value="min_qty_`$obj_id`"}
		                    {$smarty.capture.$min_qty nofilter}
		                </div>
		                {if $capture_options_vs_qty}{/capture}{/if}
	
		                {if $capture_buttons}{capture name="buttons"}{/if}
		                <div class="ut2-pb__button ty-product-block__button">
		                    {if $show_details_button}
		                        {include file="buttons/button.tpl" but_href="products.view?product_id=`$product.product_id`" but_text=__("view_details") but_role="submit"}
		                    {/if}
		
		                    {assign var="add_to_cart" value="add_to_cart_`$obj_id`"}
		                    {$smarty.capture.$add_to_cart nofilter}
		
		                    {assign var="list_buttons" value="list_buttons_`$obj_id`"}
		                    {$smarty.capture.$list_buttons nofilter}
		                </div>
		                {if $capture_buttons}{/capture}{/if}


    	                    {*assign var="sku" value="sku_`$obj_id`"*}
		                    {*$smarty.capture.$sku nofilter*}
		          
{$product.full_description nofilter}
                       
                    </div>
				</div>
				
				{assign var="form_close" value="form_close_`$obj_id`"}
				{$smarty.capture.$form_close nofilter}
				
				{if $show_product_tabs}
		            {include file="views/tabs/components/product_popup_tabs.tpl"}
		            {$smarty.capture.popupsbox_content nofilter}
	            {/if}
                
                {if $show_short_descr}
                {if $product.short_description}
                            <div class="ut2-pb__short-descr" {live_edit name="product:short_description:{$product.product_id}"}>{$product.short_description nofilter}</div>
                            {/if}
                        {/if}
                        <div class="ut2-pb__sku">
                           {assign var="sku" value="sku_`$obj_id`"}
    	                    {$smarty.capture.$sku nofilter}
</div>
			</div>
        {/if}

    {/hook}
    </div>

    {if $smarty.capture.hide_form_changed == "Y"}
        {assign var="hide_form" value=$smarty.capture.orig_val_hide_form}
    {/if}

    {hook name="products:buy_together"}{/hook}
    {hook name="products:product_tabs_pre"}
    
    {/hook}
</div>

<div class="product-details">
</div>

 <div class="opistabs">
                            {if $show_product_tabs}
        {hook name="products:product_tabs"}
            {include file="views/tabs/components/product_tabs.tpl"}

            {if $blocks.$tabs_block_id.properties.wrapper}
                {include file=$blocks.$tabs_block_id.properties.wrapper content=$smarty.capture.tabsbox_content title=$blocks.$tabs_block_id.description}
            {else}
                {$smarty.capture.tabsbox_content nofilter}
            {/if}
        {/hook}
    {/if}
                            
                        </div>

{capture name="mainbox_title"}{assign var="details_page" value=true}{/capture}