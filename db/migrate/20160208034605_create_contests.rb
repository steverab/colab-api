class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.text :short_name
      t.text :description
      t.integer :author_id
    end

    add_timestamps(:contests, null: false)
  end
end
