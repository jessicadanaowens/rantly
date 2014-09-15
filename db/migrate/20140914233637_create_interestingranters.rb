class CreateInterestingranters < ActiveRecord::Migration
  def change
    create_table :interestingranters do |t|
      t.references :user
      t.integer :ranter_id
    end
  end
end
