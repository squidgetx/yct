var toggleMenu = function() {
  $('body').toggleClass('pml-open');
  $('#mask').toggleClass('mask');
};

$('document').ready( function() {

  $('#mask').click(function() {
    toggleMenu();
  });

  $('.nav-pull-btn').click(function() {
    console.log('test');
    toggleMenu();
  });

  $('.push-menu-left').click(function() {
    toggleMenu();
  });

});
