{if $addons.ee_change_onesummer.ee_change_onesummer_promo_top_act == 'Y' && $addons.ee_change_onesummer.ee_change_onesummer_active == 'Y'}	
	<div style="z-index: 9995; border: 1px solid; text-align: center; padding: 12px; border-color: {$addons.ee_change_onesummer.ee_change_onesummer_promo_top_bordercolor}; background: {$addons.ee_change_onesummer.ee_change_onesummer_promo_top_backcolor}; color: {$addons.ee_change_onesummer.ee_change_onesummer_promo_top_color}; opacity: 0.96; width: 100%; position: fixed; top: 0px;">
		<strong>{$addons.ee_change_onesummer.ee_change_onesummer_promo_top_text nofilter}</strong>
	</div>
	{literal}
		<style>
		body {
			margin-top: 42px;
		}
		</style>
		<script>
			$(window).load(function() {
				$(window).scroll(function(){		
					var top  = window.pageYOffset || document.documentElement.scrollTop,
					left = window.pageXOffset || document.documentElement.scrollLeft;		
					if ($('body').hasClass('fixed-header') && top > 0) {
						$('.newmob, .newhd').css('margin-top', '42px');
					} else {
						$('.newmob, .newhd').css('margin-top', '0px');
					}
				});
				/*$('.ty-menu__item').show();
				$('.ty-menu__item').on('touchstart', function() {
					location.href = $(this).find('a').attr('href');
				});*/
				var flag = true;
				var str1 = 'Ваша заявка принята! Заказ';
				var str2 = 'успешно создан. Наш сотрудник свяжется с вами в ближайшее время.';		
				function check_order() {
					var elem = $('.cm-notification-content.notification-content.alert.alert-success.cm-auto-hide');
					if (flag && elem.text().indexOf(str1) != -1 && elem.text().indexOf(str2) != -1) {
						flag = false;
						ym(63281689, 'reachGoal', 'fast_form');				
					}
				}
				setInterval(check_order, 500);
				// Фикс бага с пропадающими быстрыми ссылками
				$('ul.ty-text-links.cm-popup-box.ty-text-links_show_inline').removeClass('cm-popup-box');
			});
		</script>
	{/literal}
{/if}