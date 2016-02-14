class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :ip, :null => false
      t.string :path, :null => false
      t.string :method, :null => false
      t.string :query_string
      t.string :user_agent, :null => false

      t.string :city
      t.string :region_code
      t.string :region
      t.string :zip
      t.string :country
      t.string :country_code
      t.decimal :lat
      t.decimal :lon

      t.string :isp
      t.string :organization
      t.string :reverse

      t.string :timezone

      t.belongs_to :user, index: true

      t.timestamps null: false
    end

    add_foreign_key :requests, :users, column: :user_id, primary_key: "id", on_update: :cascade, on_delete: :cascade
  end
end
