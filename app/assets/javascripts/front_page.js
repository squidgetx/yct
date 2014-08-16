$(document).ready(function() {

  $('.slide').each(function(index) {
    $(this).attr('id', index.toString());
  });


  $('#slides').bind('DOMMouseScroll mousewheel', handleScroll);

});


var handleScroll = function(e) {
  if (e.originalEvent.detail > 0 || e.originalEvent.wheelDelta < 0) {
    nextSlide();
  } else {
    prevSlide();
  }
  $('#slides').unbind('DOMMouseScroll');
  $('#slides').unbind('mousewheel');
  window.setTimeout(function() {
    $('#slides').bind('DOMMouseScroll mousewheel', handleScroll);
  },1400);
  // the above value should be tweaked to taste
  return false;
}

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
