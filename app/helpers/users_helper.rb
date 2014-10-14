module UsersHelper
  def follow_button user
    if current_user.following? user
      button_to "Unfollow", user_interesting_ranter_path(current_user, user), method: :delete
    else
      button_to "Follow", user_interesting_ranters_path(current_user, user), method: :post
    end
  end
end