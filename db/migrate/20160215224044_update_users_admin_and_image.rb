class UpdateUsersAdminAndImage < ActiveRecord::Migration
  def change
    add_column :users, :is_admin, :boolean, default: false, null: false
    add_column :users, :profile_picture, :string, default: "default_profile_picture", null: false
  end
end
