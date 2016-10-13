'use strict';

import $     from 'jquery';
import 'babel-polyfill';

import Modal from 'utils/Modal';
import Menu  from 'utils/Menu';

$(document).ready(function() {
  /**
   * Скролл к правилам квеста
   */
  $(document).on('click', '.js-scroll-rules', () => {
    $('html, body').animate({
      scrollTop: $(".js-quest-rules").offset().top
    }, 500);
  });

  /**
   * Модальное окно регистрации через соц. сети
   */
  const login = new Modal({
    modal: '.js-modal'
  });
  $(document).on('click', '.js-begin-quest', () => {
    login.show();
  });

  /**
   * Инициализация меню
   */
  const menu = new Menu({
    menu: '.js-menu-bar',
    toggler: '.js-topline-trigger',
    closer: '.js-menu-closer',
    mask: '.js-mask'
  });

  $(document).on('turbolinks:load', (e) => {
    menu.setOpened(false);
  });
});
