function truncate() {
  $('.preview_wrapper').dotdotdot({
    height: null,
    watch: 'window'
  });
}

$(document).ready(function() {

/*  $('.card_content').each(function(index) {
      var color = 'rgba(0,0,0,' + (Math.random()/4).toString() + ')'
      $(this).css('background-color', color);
  });

  $('.heading').each(function(index) {
      var color = 'rgba(0,0,0,' + (.9 - Math.random()/4).toString() + ')'
      $(this).css('background-color', color);
  });
  */

  truncate();
  console.log("test");



});
