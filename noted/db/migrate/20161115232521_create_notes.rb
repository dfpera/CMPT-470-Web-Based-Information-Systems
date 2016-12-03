class CreateNotes < ActiveRecord::Migration[5.0]
  def up
    create_table :notes do |t|
      t.integer "account_id"
      t.string "permalink"
      t.string "title"
      t.text "text"
      t.datetime "alarm"

      t.timestamps
    end
    add_index("notes", "account_id")
    add_index("notes", "permalink")
  end

  def down
    drop_table :notes
  end
end
