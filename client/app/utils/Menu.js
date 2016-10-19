'use strict';

class Menu {
  constructor(config) {
    this.opened       = false;

    this.menu         = config.menu;
    this.toggler      = config.toggler;
    this.closer       = config.closer;
    this.mask         = config.mask;
    this.closeOnEsc   = this.closeOnEsc.bind(this);
    this.handleChange = this.handleChange.bind(this);

    this.addListeners();
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
    if (this.opened) {
      this.hide();
    } else {
      this.show();
    }
  }

  show() {
    this.opened = true;

    $(this.menu).addClass('menu-bar--opened')
    $(this.mask).addClass('mask--active');

    $('body').trigger('remove:scroll');

    this.addEscListener();
  }

  hide() {
    this.opened = false;

    $(this.menu).removeClass('menu-bar--opened')
    $(this.mask).removeClass('mask--active');

    $('body').trigger('add:scroll');

    this.removeEscListener();
  }
}

export default Menu;
