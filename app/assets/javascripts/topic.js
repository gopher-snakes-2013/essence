var TopicHandler = {

  init: function(e, response){
    if(response.responseJSON.errors){
      TopicHandler.displayErrors(e, response);
    } else {
      TopicHandler.prependTopic(e, response)
    }
  },

  displayErrors: function(e, response){
    $("#new-topic-errors").hide().html(response.responseJSON.errors[0]).fadeIn(225);
  },

  // $('#foo').fadeOut("slow", function(){
  //   $('#foo').html(data);
  //   $('#foo').fadeIn("slow");
  // }

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
    $("#new-topic-errors").html("").fadeOut(225);
  },

  removeTopicOnDelete: function(){
    $(".topic-list").on('ajax:success', '.topic-name .button_to', function(e, snippets){
      $(this).closest('.topic-name').hide(225, function(){this.remove()});
      TopicHandler.appendUnaffiliatedSnippets(snippets);
    })
  },

  appendUnaffiliatedSnippets: function(snippets){
    $(".unaffiliated").append(snippets)
  }
}

$(document).ready(function(){
  $(".new-topic-form form").on('ajax:complete', TopicHandler.init)
  TopicHandler.removeTopicOnDelete();
})