class CreateEmailConfirmerTable < ActiveRecord::Migration
  def change
    create_table :email_confirmers do |t|
        t.integer  "user_id"
        t.string   "confirmation_token"
        t.datetime "created_at"
        t.datetime "updated_at"
    end
  end
end
