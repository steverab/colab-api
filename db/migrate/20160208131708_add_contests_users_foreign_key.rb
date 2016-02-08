class AddContestsUsersForeignKey < ActiveRecord::Migration
  def change
    add_foreign_key :contests, :users, column: :author_id, primary_key: "id", on_update: :cascade, on_delete: :cascade
  end
end
