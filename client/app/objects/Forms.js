'use strict';

/**
 * Jquery UJS ajax events
 */
$(document)
  .on('ajax:error', function(event, xhr, status, error) {
    /** Вставляем ошибку в ноду **/
    $('.js-form-error').text(error);
  })
  .on('ajax:success', function(data, status, xhr) {
    /** Перезагружаем страницу **/
    Turbolinks.visit(location.toString());
  });

/**
 * Показываем/скрываем галочку в инпуте в зависимости от того, введены ли данные
 */
$(document)
  .on('focusout', '.js-form input', function() {
    const $input = $(this);
    const $wrapper = $input.parent();

    if ($input.val().trim()) {
      $wrapper.addClass('input-wrapper--icon-visible')
    } else {
      $wrapper.removeClass('input-wrapper--icon-visible')
    }
  });
