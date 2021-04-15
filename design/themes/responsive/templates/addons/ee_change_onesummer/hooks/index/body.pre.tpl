{if $addons.ee_change_onesummer.ee_change_onesummer_promo_top_act == 'Y' && $addons.ee_change_onesummer.ee_change_onesummer_active == 'Y'}	
	<div style="z-index: 9995; border: 1px solid; text-align: center; padding: 12px; border-color: {$addons.ee_change_onesummer.ee_change_onesummer_promo_top_bordercolor}; background: {$addons.ee_change_onesummer.ee_change_onesummer_promo_top_backcolor}; color: {$addons.ee_change_onesummer.ee_change_onesummer_promo_top_color}; opacity: 0.96; width: 100%; position: fixed; top: 0px;">
		<strong>{$addons.ee_change_onesummer.ee_change_onesummer_promo_top_text}</strong>
	</div>
	{literal}
		<style>
		body {
			margin-top: 42px;
		}
		</style>
		<script>
		$(window).scroll(function(){		
			var top  = window.pageYOffset || document.documentElement.scrollTop,
			left = window.pageXOffset || document.documentElement.scrollLeft;		
			if ($('body').hasClass('fixed-header') && top > 0) {
				$('.newmob').css('margin-top', '42px');
			} else {
				$('.newmob').css('margin-top', '0px');
			}
		});
		/*$('.ty-menu__item').show();
		$('.ty-menu__item').on('touchstart', function() {
			location.href = $(this).find('a').attr('href');
		});*/
		</script>
	{/literal}
{/if}