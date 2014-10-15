module FavoriteRantsHelper

  def number_of_favorites rant
    rant.favorite_rants.length
  end

end