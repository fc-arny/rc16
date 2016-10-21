'use strict';

import Togglers from 'objects/Togglers';
import Menu     from 'objects/Menu';
import Scroll   from 'objects/Scroll';
import Modals   from 'objects/Modals';
import Forms    from 'objects/Forms';
import Video    from 'objects/Video';
import TableTop from 'objects/TableTop';

$(document).on('turbolinks:load', (e) => {
  Togglers.questsActive.setActivity();

  /**
   * 1) Инициализируем видео для страницы рейтинга
   * 2) запускаем интервал с запросами на рейтинг
   */
  if (location.pathname === '/top') {
    Video.start();
    TableTop.start();
  }
});

/**
 * Если пользователь перешел на другую страницу при открытом меню, закрываем меню
 */
$(document).on('turbolinks:before-visit', (e) => {
  Menu.hide();

  /**
   * 1) Удаляем видео, если уходим со страницы рейтинга
   * 2) Останавливаем интервал с запросами на рейтинг
   */
  if (location.pathname === '/top') {
    Video.stop();
    TableTop.stop();
  }
});
