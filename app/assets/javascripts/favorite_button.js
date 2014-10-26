var favoriteButtons = function() {
  $("body").on('click', ".favorite-button", function(event) {
    event.preventDefault();


    var favoriteButton = $(event.target);
    var value = favoriteButton.attr("value");
    var rantId = favoriteButton.attr('data-rant-id');

    if (value == "Favorite") {
      var postFavoriteRantPromise = $.post("/favorite_rants/" + rantId);
      postFavoriteRantPromise.success( function() {

        var favoriteButtons = $('.favorite-button')
        favoriteButtons.each( function() {
          if ($(this).attr('data-rant-id') == rantId) {
            $(this).attr('value', 'Unfavorite')
          }
        })
      });
    } else {
      var deleteInterestingRanterPromise = $.ajax({
        url: "/favorite_rants/" + rantId,
        type: 'DELETE'
      });
      deleteInterestingRanterPromise.success( function() {
        debugger;
        var favoriteButtons = $('.favorite-button')
        favoriteButtons.each( function() {
          if ($(this).attr('data-rant-id') == rantId) {
            debugger;
            $(this).attr('value', 'Favorite')

          }
        })
      })
    }
  })
}