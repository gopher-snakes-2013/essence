var TopicHandler = {

  appendTopic: function(e, response){
    var $new_topic = $(response.new_topic)
    $(".topic-list").append($new_topic);
    TopicHandler.toggleNewTopicForm();
  },

  toggleNewTopicForm: function(){
    $(".new-topic-form").fadeToggle();
    $(".new-topic-form").find("input[type=text], textarea").val("");
  },

  removeTopicOnDelete: function(){
    $(".topic-list").on('ajax:success', '.button_to', function(){
      $(this).closest('.topic-name').remove();
    })
  }

}

$(document).ready(function() {

  $("#add-new-topic").on('click', TopicHandler.toggleNewTopicForm);

  $(".new-topic-form form").on('ajax:success', TopicHandler.appendTopic)

  TopicHandler.removeTopicOnDelete();

})