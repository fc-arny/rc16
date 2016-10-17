'use strict';

import $        from 'jquery';
import Togglers from 'objects/Togglers';
import Modals   from 'objects/Modals';
import Menu     from 'objects/Menu';
import Scroll   from 'objects/Scroll';

$(document).on('turbolinks:load', (e) => {
  Togglers.questsActive.setActivity();
});

/**
 * Если пользователь перешел на другую страницу при открытом меню, закрываем меню
 */
$(document).on('turbolinks:before-visit', (e) => {
  Menu.hide();
})
