var toggleMenu = function() {
  $('#navbar').toggleClass('hidden');
  $('#nav-link').toggleClass('hidden');
};

$('document').ready( function() {

  $('#wrapper').click(function() {
    toggleMenu();
  });

  $('#navbar').click(function() {
    toggleMenu();
  });

  $('#nav-link').click(function() {
    toggleMenu();

  });

});
