$(document).ready(function() {

  $('.slide').each(function(index) {
    $(this).attr('id', index.toString());
  });

  $('.slide').first().removeClass('inactive').addClass('active');


});

var nextSlide = function() {
  var active = $('.active').first();
  active.removeClass('active').addClass('inactive-left');
  var next = $('#' + (parseInt(active.attr('id')) + 1).toString() );
  console.log(next.size());
  if (next.size() == 0) {
    next = $('#0');
    console.log('next size was 0');
    console.log(next.size());
    console.log(next);
  }
  next.removeClass('inactive').removeClass('inactive-left').addClass('active');

}
