function insertMetaChars(start_tag, end_tag, input) {
  var double = arguments.length > 1;
    var start = input.selectionStart;
  var end = input.selectionEnd;
  var old_text = input.value;
  input.value = old_text.substring(0, start) +
    (double ? start_tag + old_text.substring(start, end) + end_tag : start_tag) + old_text.substring(end);
  input.setSelectionRange(double.g || start === end ? start + start_tag.length : start, (double ? end : start) + start_tag.length);
  input.focus();
};

$(document).ready(function() {
  var input = $('.markdown_text_area')[0];

  $('.italics').click(function() {
    insertMetaChars("*","*",input);
  });

  $('.bold').click(function() {
    insertMetaChars("**","**",input);
  });

  $('.link').click(function() {
    insertMetaChars("[","](<url here>)",input);
  });

  $('.image-link').click(function() {
    insertMetaChars("![](","<image url here>)",input);
  });
});
