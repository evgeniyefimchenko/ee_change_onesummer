В главный index.php добавлены строки для устранения бага при открытии сайта браузером инстаграм
	/*Решение бага с открытием сайта в instagram*/
    $userAgent = $_SERVER['HTTP_USER_AGENT'];
    if (strpos($userAgent, 'Instagram') && !strpos($userAgent, 'iPhone') && !strpos($userAgent, 'iPod') && !strpos($userAgent, 'iPad')) {
        header('Content-type: application/pdf');
        header('Content-Disposition: inline; filename= blablabla');
        header('Content-Transfer-Encoding: binary');
        header('Accept-Ranges: bytes');
        @readfile('https://onesummer.ru/index.php');
    }

Из за использования хука {hook name="products:view_main_info"} в нескольких представлениях 
приходится изменённый файл /design/themes/abt__unitheme2/templates/blocks/product_templates/default_template.tpl при обновлениях накатывать руками.

Та же история с файлом /design/themes/abt__unitheme2/templates/addons/replace_wishlist_icon/overrides/addons/wishlist/views/wishlist/components/add_to_wishlist.tpl

Все файлы представлены в модуле и по идее должны перезаписываться при его установке.