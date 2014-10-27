class CommentsController < ApplicationController

  def create

    rant = Rant.find_by(:id => params[:rant_id])

    @comment = Comment.new(
      :user_id => current_user.id,
      :rant_id => params[:rant_id],
      :text => params[:comment][:text]
    )

    if @comment.save
      redirect_to user_rant_path(rant.user_id, params[:rant_id])
    else
      redirect_to user_rant_path(rant.user_id, params[:rant_id])
    end
  end

end