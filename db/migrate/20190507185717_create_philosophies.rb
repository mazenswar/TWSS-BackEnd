class CreatePhilosophies < ActiveRecord::Migration[5.2]
  def change
    create_table :philosophies do |t|
      t.bigint "person_id"
      t.string "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["person_id"], name: "index_philosophies_on_person_id"
    end
  end
end
