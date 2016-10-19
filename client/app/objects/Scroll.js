'use strict';

/**
 * Скролл к правилам квеста
 */
$(document).on('click', '.js-scroll-rules', () => {
  $('html, body').animate({
    scrollTop: $(".js-quest-rules").offset().top
  }, 500);
});

/** Убираем скролл **/
$(document).on('remove:scroll', function() {
  $('body').addClass('body-no-scroll');
});

/** Вовращаем скролл **/
$(document).on('add:scroll', function() {
  $('body').removeClass('body-no-scroll');
});
