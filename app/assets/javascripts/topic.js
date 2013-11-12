var TopicHandler = {

  init: function(e, response){
    if(response.responseJSON.errors){
      TopicHandler.displayErrors(e, response);
    } else {
      TopicHandler.appendTopic(e, response)
    }
  },

  toggleNewTopicForm: function(){
    $(".new-topic-form").fadeToggle();
    $(".new-topic-form").find("input[type=text], textarea").val("");
  },

  displayErrors: function(e, response){
    TopicHandler.toggleNewTopicForm();
    $("#new-topic-errors").html(response.responseJSON.errors[0]);
  },

  clearErrorsDiv: function() {
    $("#new-topic-errors").html("");
  },

  appendTopic: function(e, response){
    var $new_topic = $(response.responseJSON.new_topic)
    $(".topic-list").append($new_topic);
    TopicHandler.toggleNewTopicForm();
    TopicHandler.clearErrorsDiv();
  },

  removeTopicOnDelete: function(){
    $(".topic-list").on('ajax:success', '.button_to', function(){
      $(this).closest('.topic-name').remove();
    })
  }

}

$(document).ready(function() {
  $("#add-new-topic").on('click', TopicHandler.toggleNewTopicForm);
  $(".new-topic-form form").on('ajax:complete', TopicHandler.init)
  TopicHandler.removeTopicOnDelete();
})