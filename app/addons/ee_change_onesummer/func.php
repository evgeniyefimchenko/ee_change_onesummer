<?php
if (!defined('BOOTSTRAP')) { die('Access denied'); }

use Tygh\Registry;

function fn_ee_change_onesummer_install() {
	return true;
}

function fn_ee_change_onesummer_uninstall() {
	return true;
}

function fn_ee_change_onesummer_information() {
	$settings = Registry::get('addons.ee_change_onesummer');
	$add_style = 'border-color: ' . $settings["ee_change_onesummer_promo_top_bordercolor"] . '; background: ' . $settings["ee_change_onesummer_promo_top_backcolor"] . '; color: ' . $settings["ee_change_onesummer_promo_top_color"] . ';';
	$res = '<div style="text-align: center; padding: 12px; opacity: 0.96; width: 100%; border: 1px solid; ' . $add_style . '">';
	$res .= '<strong>' . $settings["ee_change_onesummer_promo_top_text"] . '</strong>';
	$res .= '</div>';
	return $res;
}
 
function fn_ee_change_onesummer_calculate_cart_post(&$cart, $auth, $calculate_shipping, $calculate_taxes, $options_style, $apply_cart_promotions, $cart_products, $product_groups) {
	if (Registry::get('addons.ee_change_onesummer.ee_change_onesummer_active') == 'Y') {
		if ($cart['product_groups'][0]['shippings'][16]['rate'] > 0 && $cart['product_groups'][0]['shippings'][16]['rate'] > 0) {
			if ($cart['product_groups'][0]['shippings'][16]['data']['cost'] == $cart['product_groups'][0]['shippings'][16]['rate']) {
				$cart['product_groups'][0]['shippings'][16]['rate'] += $cart['total'] / 100;
			}
			if ($cart['product_groups'][0]['shippings'][13]['data']['cost'] == $cart['product_groups'][0]['shippings'][13]['rate']) {
				$cart['product_groups'][0]['shippings'][13]['rate'] += $cart['total'] / 100;
			}
		}
	}
}

/**
* Нужен что б прибить сообщение о изменении стоимости доставки в чекауте
*/
function fn_ee_change_onesummer_checkout_select_default_payment_method() {
	if (Registry::get('addons.ee_change_onesummer.ee_change_onesummer_active') == 'Y') {
		$key = md5('W' . __('important') . __('text_shipping_rates_changed') . 'shipping_rates_changed');
		unset(Tygh::$app['session']['notifications'][$key]);
	}
}
