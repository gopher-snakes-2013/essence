var newTopicHandler = {

  appendTopic: function(e, response){
    $(".topic-list").append(response.new_topic)
  },
  displayErrors: function(e, response){
    console.log(response)
  }

}

$(document).ready(function() {
  $("#add-new-topic").on('click', toggleNewTopicForm);
  $(".new-topic-form form").on('ajax:success', newTopicHandler.appendTopic)
  $(".new-topic-form form").on('ajax:failure', newTopicHandler.displayErrors)
  $(".new-topic-form").submit(toggleNewTopicForm);
})

function toggleNewTopicForm(e) {
  $(".new-topic-form").fadeToggle();
}

