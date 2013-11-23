var TopicHandler = {

  init: function(e, response){
    if(response.responseJSON.errors){
      TopicHandler.displayErrors(e, response);
    } else {
      TopicHandler.prependTopic(e, response)
    }
  },

  displayErrors: function(e, response){
    $("#new-topic-errors").show().html(response.responseJSON.errors[0]).fadeIn(225);
  },

  prependTopic: function(e, response){
    var $new_topic = $(response.responseJSON)
    $(".topic-list").prepend($new_topic);
    TopicHandler.clearTopicForm();
    TopicHandler.clearErrorsDiv();
  },

  clearTopicForm: function(){
    $(".new-topic-form").find("input[type=text], textarea").val("");
  },

  clearErrorsDiv: function(){
    $("#new-topic-errors").html("").fadeOut(175);
  },

  removeTopicOnDelete: function(){
    $(".topic-list").on('ajax:success', '.topic-name .button_to', function(e, snippets){
      $(this).closest('.topic-name').fadeOut(175, function(){this.remove()});
      TopicHandler.appendUnaffiliatedSnippets(snippets);
    })
  },

  appendUnaffiliatedSnippets: function(snippets){
    $(".unaffiliated").append(snippets)
  },

  affiliateSnippet: function(event, ui){
    ui.draggable.fadeOut(175)
    ui.draggable.remove
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
    tolerance: 'pointer',
    drop: TopicHandler.affiliateSnippet
  })
}

$(document).ready(function(){
  $(".new-topic-form form").on('ajax:complete', TopicHandler.init);
  $('.topic-list').on('mouseenter', '.topic-name', makeDroppable)
  TopicHandler.removeTopicOnDelete();
})