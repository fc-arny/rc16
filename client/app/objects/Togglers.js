'use strict';

import Toggler from 'utils/Toggler';

/**
 * Инициализация тогглера
 */
const Togglers = {};

Togglers.questsActive = new Toggler({
  toggler: '.js-toggler-show-active',
  onChange(active) {
    Turbolinks.visit(`/quests${active ? '' : '?all=true'}`)
  },
});

export default Togglers;
