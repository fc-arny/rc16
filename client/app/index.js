'use strict';

import Togglers from 'objects/Togglers';
import Menu     from 'objects/Menu';
import Scroll   from 'objects/Scroll';
import Modals   from 'objects/Modals';
import Forms    from 'objects/Forms';
import Video    from 'objects/Video';

$(document).on('turbolinks:load', (e) => {
  Togglers.questsActive.setActivity();

  /** Инициализируем видео для страницы рейтинга **/
  if (location.pathname === '/top') {
    Video.start();
  }
});

/**
 * Если пользователь перешел на другую страницу при открытом меню, закрываем меню
 */
$(document).on('turbolinks:before-visit', (e) => {
  Menu.hide();

  /** Удаляем видео, если уходим со страницы рейтинга **/
  if (location.pathname === '/top') {
    Video.stop();
  }
});
