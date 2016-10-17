'use strict';

import Modal from 'utils/Modal';

const Modals = {};

/**
 * Модальное окно регистрации через соц. сети
 */
Modals.login = new Modal({
  modal: '.js-modal',
  opener: '.js-begin-quest'
});

export default Modals;
