var textSelection = {

  init: function(){
    $('.add-snippet').on('click', textSelection.toggleNewSnippetForm);
  },

  captureTextSelection: function(e){
    if(window.getSelection().type === "None"){
      return 0;
    } else{
      return window.getSelection().getRangeAt(0).cloneContents().textContent;
    }
  },

  toggleNewSnippetForm: function(e){
    e.preventDefault();
    var snippet = textSelection.captureTextSelection();
    if(snippet.length > 0){
      $('#new_snippet').fadeToggle();
    } else{
      console.log("Select some text!")
    }
  }

}

$(document).ready(function(){
  textSelection.init();
})