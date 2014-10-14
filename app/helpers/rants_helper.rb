module RantsHelper

  def favorite_rant? rant
    FavoriteRant.where(rant_id: rant, user_id: current_user).first
  end

  def favorite_rant_button rant
    if favorite_rant? rant
      button_to "Unfavorite", user_favorite_rant_path(current_user, rant), :class => "button", :method => :delete
    else
      button_to "Favorite", user_favorite_rants_path(current_user, rant), method: :post, class: "button"
    end
  end
end
