var SnippetHandler = {
  removeSnippetOnDelete: function(){
    $(this).hide(225, function(){$(this).remove()});
  }
}

$(document).ready(function(){
  $('.unaffiliated').on('click', '.snippet', SnippetHandler.removeSnippetOnDelete)
})