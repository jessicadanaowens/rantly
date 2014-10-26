module UsersHelper
  def follow_button user
    if current_user.following? user
      button_to "Unfollow", add_interesting_ranter_path(user), method: :delete, class: "follow-button", :"data-ranter-id" => user.id, :"data-current-user-id" => current_user.id
    else
      button_to "Follow", delete_interesting_ranter_path(user), method: :post, class: "follow-button", :"data-ranter-id" => user.id, :"data-current-user-id" => current_user.id
    end
  end
end