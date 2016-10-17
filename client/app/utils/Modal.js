'use strict';

import $ from 'jquery';

const closeClasses = ['js-modal', 'modal-middle', 'js-modal-close'];

class Modal {
  constructor(config) {
    this.modal      = config.modal;
    this.opener     = config.opener;

    this.closeOnEsc = this.closeOnEsc.bind(this);

    this.addListener();
  }

  addListener() {
    /* Скрыть модальное окно */
    $(document).on('click', this.modal, (e) => {
      const target = $(e.target);
      const shouldHide = closeClasses.some(className =>
        target.hasClass(className)
      );

      if (shouldHide) {
        this.hide();
      }
    });

    /* Показать модальное окно */
    $(document).on('click', this.opener, (e) => {
      this.show();
    });
  }

  addEscListener() {
    $(document).on('keyup', this.closeOnEsc);
  }

  removeEscListener() {
    $(document).off('keyup', this.closeOnEsc);
  }

  closeOnEsc(e) {
    if (e.keyCode === 27) {
      this.hide();
    }
  }

  show() {
    $(this.modal).show();
    $('html, body').addClass('body-no-scroll');

    this.addEscListener();
  }

  hide() {
    $(this.modal).hide();
    $('html, body').removeClass('body-no-scroll');

    this.removeEscListener();
  }
}

export default Modal;
