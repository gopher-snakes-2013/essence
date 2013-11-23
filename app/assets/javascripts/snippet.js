var SnippetHandler = {
  removeSnippetOnDelete: function(){
    $(".snippets_list").on("ajax:success", '.snippet .button_to', function(){
      $(this).closest('.snippet').fadeOut(175, function(){$(this).remove()});
    })
  },

  removeUnaffiliatedSnippetOnDelete: function(){
    $(".unaffiliated").on('ajax:success', '.snippet .button_to', function(){
      $(this).closest('.snippet').fadeOut(175, function(){this.remove()});
    })
  },
}

makeDraggable = function(){
  $(this).draggable({ revert: true, revertDuration: 150 })
}

$(document).ready(function(){
  SnippetHandler.removeSnippetOnDelete();
  SnippetHandler.removeUnaffiliatedSnippetOnDelete();
  $(".unaffiliated").on('mouseover', '.snippet', makeDraggable)
})