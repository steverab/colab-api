class CreateContestRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, :null => false

      t.timestamps null: false
    end

    create_table :contest_user_roles do |t|
      t.belongs_to :contest, index: true
      t.belongs_to :user, index: true
      t.belongs_to :role, index: true

      t.timestamps null: false
    end

    add_foreign_key :contest_user_roles, :contests, column: :contest_id, primary_key: "id", on_update: :cascade, on_delete: :cascade
    add_foreign_key :contest_user_roles, :users, column: :user_id, primary_key: "id", on_update: :cascade, on_delete: :cascade
    add_foreign_key :contest_user_roles, :roles, column: :role_id, primary_key: "id", on_update: :cascade, on_delete: :cascade
  end
end
