'use strict';

import Menu from 'utils/Menu';

/**
 * Инициализация меню
 */
export default new Menu({
  menu: '.js-menu-bar',
  toggler: '.js-topline-trigger',
  closer: '.js-menu-closer',
  mask: '.js-mask'
});
