var SnippetHandler = {
  removeSnippetOnDelete: function(){
    $(".snippets_list").on("ajax:success", '.snippet .button_to', function(){
      $(this).closest('.snippet').hide(225, function(){$(this).remove()});
    })
  },

  removeUnaffiliatedSnippetOnDelete: function(){
    $(".topic-list").on('ajax:success', '.snippet .button_to', function(){
      $(this).closest('.snippet').hide(225, function(){this.remove()});
    })
  },
}

makeDraggable = function(){
  $(this).draggable()
}

$(document).ready(function(){
  SnippetHandler.removeSnippetOnDelete();
  SnippetHandler.removeUnaffiliatedSnippetOnDelete();
  $(".unaffiliated").on('click', '.snippet', makeDraggable)
})