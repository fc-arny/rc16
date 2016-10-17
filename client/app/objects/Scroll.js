'use strict';

import $ from 'jquery';

/**
 * Скролл к правилам квеста
 */
$(document).on('click', '.js-scroll-rules', () => {
  $('html, body').animate({
    scrollTop: $(".js-quest-rules").offset().top
  }, 500);
});
