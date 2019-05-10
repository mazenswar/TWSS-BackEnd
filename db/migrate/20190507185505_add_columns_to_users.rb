class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :profile_img, :string
    add_column :users, :bio, :string
    add_column :users, :email, :string
  end
end
