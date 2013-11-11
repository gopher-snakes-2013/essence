$(document).ready(function() {
  $("#add-new-topic").on('click', toggleNewTopicForm);

  $(".new-topic-form").submit(toggleNewTopicForm);
})

function toggleNewTopicForm(e) {
  $(".new-topic-form").fadeToggle();
}