class InterestingRanterLocator

  def initialize(current_user)
    @current_user = current_user
  end

  def interesting_ranters_ids
    InterestingRanter.where(:user_id => @current_user.id).select(:ranter_id).map(&:ranter_id)
  end

end