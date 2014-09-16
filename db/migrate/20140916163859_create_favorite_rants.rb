class CreateFavoriteRants < ActiveRecord::Migration
  def change
    create_table :favorite_rants do |t|
      t.references :rant
      t.references :user
    end
  end
end
