'use strict';

import $        from 'jquery';
import Togglers from 'objects/Togglers';
import Menu     from 'objects/Menu';

$(document).on('turbolinks:load', (e) => {
  Togglers.questsActive.setActivity();
});

/**
 * Если пользователь перешел на другую страницу при открытом меню, закрываем меню
 */
$(document).on('turbolinks:before-visit', (e) => {
  Menu.hide();
});
