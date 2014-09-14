class CreateRants < ActiveRecord::Migration
  def change
    create_table :rants do |t|
      t.string :topic
      t.text :rant
      t.references :user
    end
  end
end
