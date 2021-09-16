/*globals $ */
$(function() {
  $('[data-include]').each(function() {
    var $container = $(this);
    var url = $container.attr('data-include');
    $container.load(url);
  });
});
