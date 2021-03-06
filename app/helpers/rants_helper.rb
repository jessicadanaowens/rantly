module RantsHelper

  def favorite_rant? rant
    FavoriteRant.where(rant_id: rant, user_id: current_user).first
  end

  def favorite_rant_button rant
    if favorite_rant? rant
      button_to "Unfavorite", user_favorite_rants_path(current_user, rant), :class => "favorite-button", :"data-rant-id" => rant.id, :"data-current-user-id" => current_user.id, :method => :delete
    else
      button_to "Favorite", user_favorite_rants_path(current_user, rant), method: :post, class: "favorite-button", :"data-rant-id" => rant.id, :"data-current-user-id" => current_user.id
    end
  end

  def truncate rant
    array = rant.split(" ")
    new_array = []
    count = 0

    array.each do |word|
      if count == 300
        new_array.push('...')
        break
      else
        new_array.push(word)
        count += 1
      end
    end
    new_array.join(" ")
  end

end
