'use strict';

/**
 * Скролл к правилам квеста
 */
$(document).on('click', '.js-scroll-rules', () => {
  $('html, body').animate({
    scrollTop: $(".js-quest-rules").offset().top
  }, 500);
});

const preventScroll = function(e) {
  e.preventDefault();
};

/** Убираем скролл **/
$('body').on('remove:scroll', function() {
  const $body = $(this);

  $body
    .on('touchmove', preventScroll)
    .addClass('body-no-scroll');
});

/** Вовращаем скролл **/
$('body').on('add:scroll', function() {
  const $body = $(this);

  $body
    .off('touchmove', preventScroll)
    .removeClass('body-no-scroll');
});
