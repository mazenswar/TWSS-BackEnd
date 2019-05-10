class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.bigint "person_id"
      t.string "content"
      t.string "source"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["person_id"], name: "index_quotes_on_person_id"
    end
  end
end
