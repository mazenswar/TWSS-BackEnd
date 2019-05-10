class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.bigint "user_id"
      t.bigint "post_id"
      t.integer "number", default: 0
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["post_id"], name: "index_likes_on_post_id"
      t.index ["user_id"], name: "index_likes_on_user_id"
    end
  end
end
