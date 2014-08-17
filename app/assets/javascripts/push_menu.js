var toggleMenu = function() {
  $('#navbar').toggleClass('hidden');
  $('#nav-left').toggleClass('hidden');
};

$('document').ready( function() {

  $('#navbar').click(function() {
    toggleMenu();
  });

  $('#nav-link').click(function() {
    toggleMenu();

  });

});
