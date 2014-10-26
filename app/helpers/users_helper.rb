module UsersHelper
  def follow_button user
    if current_user.following? user
      button_to "Unfollow", user_interesting_ranter_path(current_user, user), method: :delete, class: "follow-button", :"data-ranter-id" => user.id, :"data-current-user-id" => current_user.id
    else
      button_to "Follow", user_interesting_ranters_path(current_user, user), method: :post, class: "follow-button", :"data-ranter-id" => user.id, :"data-current-user-id" => current_user.id
    end
  end
end