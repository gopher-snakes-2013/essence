var SourcesHandler = {
  init: function(e, response){
    if(response.responseJSON.errors){
      SourcesHandler.displaySourcesErrors(response)
    } else {
      SourcesHandler.appendNewSource(response)
    }
  },

  appendNewSource: function(response) {
    $(".show_pdf_library ul").append(response.responseJSON)
    $(".add_pdf form #source_title").val("")
    $(".add_pdf form #source_url").val("")
  },

  displaySourcesErrors: function(response) {
    $(".library_errors").show().html(response.responseJSON.errors[0])
  }
}

$(document).ready(function() {
  $(".addSourceUrl").on('ajax:complete', function(e, response) {
    SourcesHandler.init(e, response);
  });
})