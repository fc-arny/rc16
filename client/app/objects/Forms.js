'use strict';

$('.js-form')
  .on('ajax:error', function(event, xhr, status, error) {
    /** Вставляем ошибку в ноду **/
    $('.js-form-error').text(error);
  })
  .on('ajax:success', function(data, status, xhr) {
    /** Перезагружаем страницу **/
    Turbolinks.visit(location.toString());
  });
