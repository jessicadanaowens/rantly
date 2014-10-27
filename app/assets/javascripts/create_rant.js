var createRant = function() {

  $("body").on('click', ".rant-form-submit-button", function(event) {
    event.preventDefault();

    $(".topic-errors").html("");
    $(".rant-errors").html("");

    var topic = $('.rant-form-field').val();
    var rant = $('.rant-form-area').val();

    var postRantPromise = $.post("/rants", {topic: topic, rant: rant});
    postRantPromise.success( function(validationErrorMessages) {
      if (validationErrorMessages.errors) {
        $(".topic-errors").html(validationErrorMessages.errors.topic);
        $(".rant-errors").html(validationErrorMessages.errors.rant);
      } else {
        location.reload(true);
      }
    });
  });
};