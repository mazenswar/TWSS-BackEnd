class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string "name"
      t.string "profile_img"
      t.string "index_img"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
