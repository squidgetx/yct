var toggleMenu = function() {
  $('#navbar').toggleClass('hidden');
  $('#nav-link').toggleClass('hidden');
};

$('document').ready( function() {

  $('#navbar').click(function() {
    toggleMenu();
  });

  $('#nav-link').click(function() {
    toggleMenu();

  });

});
