class ChangeInterestingrantersTableNameToInterestingRanters < ActiveRecord::Migration
  def change
    rename_table :interestingranters, :interesting_ranters
  end
end

