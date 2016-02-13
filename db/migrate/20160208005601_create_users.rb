class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :screen_name
      t.string :email
      t.string :password
      t.text :short_bio

      t.timestamps null: false
    end
  end
end
