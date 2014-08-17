$(document).ready(function() {

  $('.slide').hover(function() {
    $(this).children('.heading_container').removeClass('hidden-fade');
  });

  $('.slide').mouseleave(function() {
    $(this).children('.heading_container').addClass('hidden-fade');
  });

});
