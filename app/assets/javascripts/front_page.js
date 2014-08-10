$(document).ready(function() {

  $('.slide').each(function(index) {
    $(this).attr('id', index.toString());
  });

  $('.slide').first().removeClass('inactive').addClass('active');


   //Firefox
  $('#slides').bind('DOMMouseScroll', function(e){
     if (e.originalEvent.detail > 0) {
       nextSlide();
     } else {
       prevSlide();
     }
     return false;
  });

  //IE, Opera, Safari
  $('#slides').bind('mousewheel', function(e){
     if (e.originalEvent.wheelDelta < 0) {
       nextSlide();
     } else {
       prevSlide();
     }
     return false;
   });

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
