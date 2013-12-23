String.prototype.removeDashWithLineBreak = function() {
  return this.replace(/-\r?\n|/g,"");
}

String.prototype.replaceLineBreakWithSpace = function() {
  return this.replace(/\r?\n/g," ");
}

String.prototype.replaceDoubleSpaceWithSingle = function() {
  return this.replace(/(  )/g, " ");
}

var SnippetHandler = {
  init: function(){
    // This will grab all the divs that were selected
    var snippet = SnippetHandler.captureSelection();

    // Check if there were any divs/text selected
    if(!snippet.children.length){
      console.log("Please select some text!")
    } else {
      // Size limit on snippet
      if (snippet.textContent.length > 254){
        alert("Sorry, your selection was too long! The limit is 255 characters. <3 Essence")
      } else {
      snippet = SnippetHandler.formatTextFromDivs(snippet.children)
      SnippetHandler.showAndFillNewSnippetForm(snippet)
      }
    }
  },

  captureSelection: function(e){
    if(window.getSelection().type === "None"){
      return 0;
    } else {
      return window.getSelection().getRangeAt(0).cloneContents();
    }
  },

  formatTextFromDivs: function(snippetDivs){
    // Goes through each div and grabs the text and adds it to a string
    var snipString;
    for(var i=0;i<snippetDivs.length;i++){
      snipString += " " + snippetDivs[i].textContent;
    }
    return snipString.removeDashWithLineBreak().replaceLineBreakWithSpace().replaceDoubleSpaceWithSingle();
  },

  showAndFillNewSnippetForm: function(snippet){
    $('.findbar-snippet').fadeToggle();
    $('.findbar-snippet').removeClass('hidden')
    $('#snippet_content').val(snippet)
  }
}

$(document).ready(function(){
  $("#toolbarViewerRight").on('click', '.add-snippet', SnippetHandler.init)
  $(".new_snippet").on('ajax:complete', function(){
    $('.findbar-snippet').fadeToggle();
    $('.findbar-snippet').addClass('hidden')
  })
})