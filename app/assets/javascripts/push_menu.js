var toggleMenu = function() {
  $('body').toggleClass('pml-open');
  $('#mask').toggleClass('mask');
};

$('#mask').ready( function() {

  $('#mask').click(function() {
    toggleMenu();
  });

});
