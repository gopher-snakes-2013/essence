var TopicHandler = {

  init: function(e, response){
    if(response.responseJSON.errors){
      TopicHandler.displayErrors(e, response);
    } else {
      TopicHandler.prependTopic(e, response)
    }
  },

  toggleNewTopicForm: function(){
    var $form = $(".new-topic-form")
    if($form.hasClass('hidden')){
      $form.fadeIn(500);
      $form.removeClass('hidden')
    } else {
      $form.fadeOut(500);
      $form.addClass('hidden')
    }
    $(".new-topic-form").find("input[type=text], textarea").val("");
  },

  displayErrors: function(e, response){
    TopicHandler.toggleNewTopicForm();
    $("#new-topic-errors").html(response.responseJSON.errors[0]);
  },

  clearErrorsDiv: function() {
    $("#new-topic-errors").html("");
  },

  prependTopic: function(e, response){
    var $new_topic = $(response.responseJSON)
    $(".topic-list").prepend($new_topic);
    TopicHandler.toggleNewTopicForm();
    TopicHandler.clearErrorsDiv();
  },

  removeTopicOnDelete: function(){
    $(".topic-list").on('ajax:success', '.topic-name .button_to', function(e, snippets){
      $(this).closest('.topic-name').hide(225, function(){this.remove()});
      TopicHandler.appendUnaffiliatedSnippets(snippets);
    })
  },

  appendUnaffiliatedSnippets: function(snippets){
    $(".unaffiliated").append(snippets)
  },

  affiliateSnippet: function(event, ui){
    ui.draggable.hide(200)
    var snippet_id = ui.draggable.attr('data-id');
    var topic_id = $(this).attr('data-id')
    $.ajax({
      url: '/snippets/'+snippet_id,
      type: 'put',
      data: { "snippet_id": snippet_id, "topic_id": topic_id }
    }).done(function(){
      console.log("success!")
    }).error(function(){
      console.log("Error!")
    })
  }
}

makeDroppable = function(){
  $(this).droppable({
    tolerance: 'touch',
    drop: TopicHandler.affiliateSnippet
  })
}

$(document).ready(function(){
  $("#add-new-topic").on('click', TopicHandler.toggleNewTopicForm);
  $(".new-topic-form form").on('ajax:complete', TopicHandler.init);
  TopicHandler.removeTopicOnDelete();
  $('.topic-list').on('mouseover', '.topic-name', makeDroppable)
})