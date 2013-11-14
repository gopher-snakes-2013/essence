var SnippetHandler = {
  removeSnippetOnDelete: function(){
    $(this).hide(225, function(){ $(this).remove() });
  },

  removeUnaffiliatedSnippetOnDelete: function(){
    $(".topic-list").on('ajax:success', '.snippet .button_to', function(){
      $(this).closest('.snippet').hide(225, function(){ this.remove() });
    })
  }
}

$(document).ready(function(){
  $('.snippets_list').on('click', '.snippet', SnippetHandler.removeSnippetOnDelete)
  SnippetHandler.removeUnaffiliatedSnippetOnDelete();
})