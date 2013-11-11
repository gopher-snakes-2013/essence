var textSelection = {

  init: function(){
    $('.add-snippet').on('click', textSelection.captureTextSelection);
  },

  captureTextSelection: function(e){
    e.preventDefault();
    textSelection.appendToPage(window.getSelection().getRangeAt(0).cloneContents().textContent);
  },

  appendToPage: function(text){
    $('.main_content').append(text);
  }
}

$(document).ready(function(){
  textSelection.init();
})