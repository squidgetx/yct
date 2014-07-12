function insertMetaChars(start_tag, end_tag) {
  var double = arguments.length > 1;
  var input = $('.markdown_text_area')[0];
  var start = input.selectionStart;
  var end = input.selectionEnd;
  var old_text = input.value;
  input.value = old_text.substring(0, start) +
    (double ? start_tag + old_text.substring(start, end) + end_tag : start_tag) + old_text.substring(end);
  input.setSelectionRange(double.g || start === end ? start + start_tag.length : start, (double ? end : start) + start_tag.length);
  input.focus();
};

$(document).ready(function() {
  $('.italics').click(function() {
    insertMetaChars("*","*");
  });

  $('.bold').click(function() {
    insertMetaChars("**","**");
  });

  $('.link').click(function() {
    insertMetaChars("[","](<url here>)");
  });

});
