String.prototype.removeDashWithLineBreak = function() {
  return this.replace(/-\r?\n|/g,"");
}

String.prototype.replaceLineBreakWithSpace = function() {
  return this.replace(/\r?\n/g," ");
}

var SnippetHandler = {
  init: function(){
    var snippet = SnippetHandler.captureSnippet()
    if(!snippet.length){
      console.log("Please select some text!")
    } else {
      snippet = SnippetHandler.formatText(snippet)
      SnippetHandler.showAndFillNewSnippetForm(snippet)
    }
  },

  captureSnippet: function(e){
    if(window.getSelection().type === "None"){
      return 0;
    } else {
      return window.getSelection().getRangeAt(0).cloneContents().textContent.trim()
    }
  },

  formatText: function(string){
    return string.removeDashWithLineBreak().replaceLineBreakWithSpace();
  },

  showAndFillNewSnippetForm: function(snippet){
    $('#new_snippet').fadeToggle();
    $('#snippet_content').val(snippet)
  },

  deleteSnippet: function(){
    $(this).hide(225, function(){$(this).remove()});
  }
}

$(document).ready(function(){
  $("#toolbarViewerRight").on('click', '.add-snippet', function(){alert("IN SNIPPET HANDLER")})
  $(".new_snippet").on('ajax:complete', function(){
    $('#new_snippet').fadeToggle();
  })
  $('.snippets_list').on('click', '.snippet', SnippetHandler.deleteSnippet)
})