<?php

if (!defined('BOOTSTRAP')) { die('Access denied'); }

fn_register_hooks (
	'calculate_cart_post', 'checkout_select_default_payment_method'
);
