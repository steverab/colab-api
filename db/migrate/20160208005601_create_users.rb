class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :screen_name
      t.string :email
      t.string :password
      t.text :short_bio
    end
    
    add_timestamps(:users, null: false)
  end
end
