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
    $('.findbar-snippet').fadeToggle();
    $('.findbar-snippet').removeClass('hidden');
    $('#snippet_content').val(snippet)
  }
}

var saveSnippet = function(e){
  e.preventDefault()
  console.log(this)
  var $newSnippet = $(this);
  $.ajax({
    url: $newSnippet.prop('action'),
    type: $newSnippet.prop('method'),
    data: $newSnippet.val()
  }).done( function(JTR) {
    console.log(JTR);
  })
}

$(document).ready(function(){
  $("#toolbarViewerRight").on('click', '.add-snippet', SnippetHandler.init)
  $('#new_snippet').on('submit', saveSnippet)
// $("#new_snippet").on('submit', function(){
//   $('#new_snippet').fadeToggle();
//   $('#new_snippet').addClass('hidden')
// })
});