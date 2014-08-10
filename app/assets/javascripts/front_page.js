$(document).ready(function() {

  $('.slide').each(function(index) {
    $(this).attr('id', index.toString());
  });

  $('.slide').first().removeClass('inactive').addClass('active');


});

var nextSlide = function() {
  var active = $('.active').first();
  var next = $('#' + (parseInt(active.attr('id')) + 1).toString() );
  if (next.size() != 0) {
    active.removeClass('active').addClass('inactive-left');
    next.removeClass('inactive').addClass('active');
  }
}

var prevSlide = function() {
  var active = $('.active').first();
  var prev = $('#' + (parseInt(active.attr('id')) - 1).toString() );
  if (prev.size() != 0) {
    active.removeClass('active').addClass('inactive');
    prev.removeClass('inactive-left').addClass('active');
  }
}
