class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.string :name
      t.string :short_name
      t.string :description
      t.integer :author_id
    end

    add_timestamps(:contests, null: false)
  end
end
