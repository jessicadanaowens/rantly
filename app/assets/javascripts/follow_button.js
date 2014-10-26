var followButtons = function() {
  $("body").on('click', ".follow-button", function(event) {
    event.preventDefault();


    var followButton = $(event.target);
    var value = followButton.attr("value");
    var ranterId = followButton.attr('data-ranter-id');

    if (value == "Follow") {
      var postInterestingRanterPromise = $.post("/interesting_ranters/" + ranterId);
      postInterestingRanterPromise.success( function() {

        var followButtons = $('.follow-button')
        followButtons.each( function() {
          if ($(this).attr('data-ranter-id') == ranterId) {
            $(this).attr('value', 'Unfollow')
          }
        })
      });
    } else {
      var deleteInterestingRanterPromise = $.ajax({
        url: "/interesting_ranters/" + ranterId,
        type: 'DELETE'
      });
      deleteInterestingRanterPromise.success( function() {
        debugger;
        var followButtons = $('.follow-button')
        followButtons.each( function() {
          if ($(this).attr('data-ranter-id') == ranterId) {
            debugger;
            $(this).attr('value', 'Follow')
            $(this).parent().parent().parent().remove();
          }
        })
      })
    }
  })
}