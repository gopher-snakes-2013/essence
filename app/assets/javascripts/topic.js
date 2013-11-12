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
    var $new_topic = $(response.responseJSON.new_topic)
    $(".topic-list").prepend($new_topic);
    TopicHandler.toggleNewTopicForm();
    TopicHandler.clearErrorsDiv();
  },

  removeTopicOnDelete: function(){
    $(".topic-list").on('ajax:success', '.button_to', function(e, data){
      $(this).closest('.topic-name').remove();
      $(".unaffiliated").append(data);
    })
  }

}

$(document).ready(function(){
  $("#add-new-topic").on('click', TopicHandler.toggleNewTopicForm);
  $(".new-topic-form form").on('ajax:complete', TopicHandler.init)
  TopicHandler.removeTopicOnDelete();
})