'use strict';

require('jquery-ujs');

import Togglers from 'objects/Togglers';
import Menu     from 'objects/Menu';
import Scroll   from 'objects/Scroll';
import Modals   from 'objects/Modals';
import Forms    from 'objects/Forms';

$(document).on('turbolinks:load', (e) => {
  Togglers.questsActive.setActivity();
});

/**
 * Если пользователь перешел на другую страницу при открытом меню, закрываем меню
 */
$(document).on('turbolinks:before-visit', (e) => {
  Menu.hide();
});
