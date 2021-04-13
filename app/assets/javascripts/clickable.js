$(document).ready(function(){
  $(".clickable").click(function (e) {
      var selection = window.getSelection();
      if (!selection || selection.rangeCount < 1) return true;
      var range = selection.getRangeAt(0);
      var node = selection.anchorNode;
      var word_regexp = /^\w*$/;
  
      // Extend the range backward until it matches word beginning
      while ((range.startOffset > 0) && range.toString().match(word_regexp)) {
        range.setStart(node, (range.startOffset - 1));
      }
      // Restore the valid word match after overshooting
      if (!range.toString().match(word_regexp)) {
        range.setStart(node, range.startOffset + 1);
      }
  
      // Extend the range forward until it matches word ending
      while ((range.endOffset < node.length) && range.toString().match(word_regexp)) {
        range.setEnd(node, range.endOffset + 1);
      }
      // Restore the valid word match after overshooting
      if (!range.toString().match(word_regexp)) {
        range.setEnd(node, range.endOffset - 1);
      }
  
      var word = range.toString();
      translate(word);
  });
});
