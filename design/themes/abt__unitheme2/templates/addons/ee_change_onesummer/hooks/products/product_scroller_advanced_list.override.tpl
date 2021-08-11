<div class="ut2-gl__item {if $settings.abt__ut2.product_list.decolorate_out_of_stock_products == "Y" && $product.amount <= 0}out-of-stock{/if}" style="{$smarty.capture.abt__ut2_gl_item_height nofilter}px">

	{* Start ut2-gl *}

	{if $product}
		{assign var="obj_id" value=$product.product_id}
		{assign var="obj_id_prefix" value="`$obj_prefix``$product.product_id`"}

		{include file="common/product_data.tpl" product=$product}

		{assign var="form_open" value="form_open_`$obj_id`"}
		{$smarty.capture.$form_open nofilter}

		{hook name="products:product_multicolumns_list"}

			<div class="ut2-gl__body" style="min-height: {$th}px">
				<div class="ut2-gl__image" style="height: {$settings.Thumbnails.product_lists_thumbnail_height|intval}px">
					{capture name="main_icon"}
						<a href="{"products.view?product_id=`$product.product_id`"|fn_url}">
							{include file="common/image.tpl" lazy_load=true images=$product.main_pair image_height=$block.properties.abt__ut2_thumbnail_height|default:$settings.Thumbnails.product_lists_thumbnail_height image_width=$block.properties.thumbnail_width|default:$settings.Thumbnails.product_lists_thumbnail_width}
						</a>
					{/capture}

					{$smarty.capture.main_icon nofilter}

					{assign var="product_labels" value="product_labels_`$obj_prefix``$obj_id`"}
					{$smarty.capture.$product_labels nofilter}

					<div class="ut2-gl__buttons">
						{if !$quick_view && $settings.Appearance.enable_quick_view == 'Y' && $settings.abt__device != "mobile"}
							{include file="views/products/components/quick_view_link.tpl" quick_nav_ids=$quick_nav_ids}
						{/if}
					   
						{if $settings.General.enable_compare_products == "Y" && !$hide_compare_list_button || $product.feature_comparison == "Y"}
							{include file="buttons/add_to_compare_list.tpl" product_id=$product.product_id}
						{/if}
					</div>

					{*
					{$b_feature=$product.abt__ut2_features[$settings.abt__ut2.general.brand_feature_id]}
					<div class="ypi-brand">{$b_feature.variant}</div>
					*}

					{if $show_brand_logo and $settings.abt__ut2.general.brand_feature_id > 0}
						{$b_feature=$product.abt__ut2_features[$settings.abt__ut2.general.brand_feature_id]}
						{if $b_feature.variants[$b_feature.variant_id].image_pairs}
							<div class="brand-img">
								{include file="common/image.tpl" image_height=20 images=$b_feature.variants[$b_feature.variant_id].image_pairs no_ids=true}
							</div>
						{/if}
					{/if}
				</div>
				
				{hook name="products:video_gallery"}{/hook}
<div class="izbr"> {if $addons.wishlist.status == "A" && !$hide_wishlist_button}
							{include file="addons/wishlist/views/wishlist/components/add_to_wishlist.tpl" but_id="button_wishlist_`$obj_prefix``$product.product_id`" but_name="dispatch[wishlist.add..`$product.product_id`]" but_role="text"}
						{/if}</div>
				{assign var="rating" value="rating_$obj_id"}
				{hook name="products:product_rating"}
				{if $smarty.capture.$rating|strlen > 40 && $product.discussion_type && $product.discussion_type != 'D'}
					<div class="ut2-gl__rating">{$smarty.capture.$rating nofilter}</div>
				{else}
					<div class="ut2-gl__rating no-rating">
						{if $addons.discussion.status == "A"}
							<span class="ty-nowrap ty-stars"><i class="ty-icon-star-empty"></i><i class="ty-icon-star-empty"></i><i class="ty-icon-star-empty"></i><i class="ty-icon-star-empty"></i><i class="ty-icon-star-empty"></i></span>
						{/if}
					</div>
				{/if}
				{/hook}

				{if $product.product_code and $show_sku}
					{assign var="sku" value="sku_$obj_id"}
					{$smarty.capture.$sku nofilter}
				{/if}

				<div class="ut2-gl__name">
					{if $item_number == "Y"}
						<span class="item-number">{$cur_number}.&nbsp;</span>
						{math equation="num + 1" num=$cur_number assign="cur_number"}
					{/if}

					{assign var="name" value="name_$obj_id"}
					{$smarty.capture.$name nofilter}
				</div>

				<div class="ut2-gl__price {if $product.price == 0}ut2-gl__no-price{/if}">
					<div>
						{assign var="old_price" value="old_price_`$obj_id`"}
						{if $smarty.capture.$old_price|trim}{$smarty.capture.$old_price nofilter}{/if}

						{if ($ab_dotd_product_ids && $product.product_id|in_array:$ab_dotd_product_ids) or ($product.promotions)}
							<div class="ab_dotd_product_label">{__('ab__dotd_product_label')}</div>
						{/if}
					</div>
					<div>
						{assign var="price" value="price_`$obj_id`"}
						{$smarty.capture.$price nofilter}

						{assign var="clean_price" value="clean_price_`$obj_id`"}
						{$smarty.capture.$clean_price nofilter}

						{assign var="list_discount" value="list_discount_`$obj_id`"}
						{$smarty.capture.$list_discount nofilter}
					</div>
				</div>

				{if $show_add_to_cart}
					<div class="ut2-gl__control {if !$hide_form && $addons.call_requests.buy_now_with_one_click == "Y" && ($auth.user_id || $settings.General.allow_anonymous_shopping == "allow_shopping")}bt-2x{/if} {if $settings.abt__ut2.product_list.$tmpl.show_qty[$settings.abt__device] == 'Y' && $settings.General.allow_anonymous_shopping == "allow_shopping" && !$product.has_options}ut2-view-qty{/if}">

						{if $show_qty}
							<div class="ut2-gl__qty">
								{assign var="qty" value="qty_`$obj_id`"}
								{$smarty.capture.$qty nofilter}
							</div>
						{/if}

						<div class="button-container">
							{assign var="add_to_cart" value="add_to_cart_`$obj_id`"}
							{$smarty.capture.$add_to_cart nofilter}
						</div>

					</div>
				{/if}
			</div>

		{/hook}
		{assign var="form_close" value="form_close_`$obj_id`"}
		{$smarty.capture.$form_close nofilter}

	{/if}
	{* End ut2-gl *}

</div>