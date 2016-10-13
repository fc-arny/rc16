'use strict';

import $ from 'jquery';

class Menu {
  constructor(config) {
    Object.assign(this, config);

    this.opened       = false;
    this.closeOnEsc   = this.closeOnEsc.bind(this);
    this.handleChange = this.handleChange.bind(this);

    this.addListeners();
  }

  setOpened(opened) {
    this.opened = opened;
  }

  addListeners() {
    /**
     * Добавляем обработчики ко всем элементам
     */
    $(document).on('click', `${this.toggler}, ${this.closer}, ${this.mask}`, this.handleChange);
  }

  addEscListener() {
    $(document).on('keyup', this.closeOnEsc);
  }

  removeEscListener() {
    $(document).off('keyup', this.closeOnEsc);
  }

  closeOnEsc(e) {
    if (e.keyCode === 27) {
      this.handleChange();
    }
  }

  handleChange() {
    this.opened = !this.opened;

    if (this.opened) {
      this.show();
    } else {
      this.hide();
    }
  }

  show() {
    $(this.menu).addClass('menu-bar--opened')
    $(this.mask).addClass('mask--active');
    $('body').addClass('body-no-scroll');

    this.addEscListener();
  }

  hide() {
    $(this.menu).removeClass('menu-bar--opened')
    $(this.mask).removeClass('mask--active');
    $('body').removeClass('body-no-scroll');

    this.removeEscListener();
  }
}

export default Menu;
