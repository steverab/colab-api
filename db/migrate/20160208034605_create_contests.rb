class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.text :short_name
      t.text :description

      t.timestamps null: false
    end
  end
end
