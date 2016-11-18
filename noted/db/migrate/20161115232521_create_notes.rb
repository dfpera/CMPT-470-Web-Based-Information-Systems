class CreateNotes < ActiveRecord::Migration[5.0]
  def up
    create_table :notes do |t|
      t.integer "account_id" # Foreign key to Accounts Table
      t.string "title"
      t.text "text"

      t.timestamps
    end
    add_index("notes", "account_id")
  end

  def down
    # Don't need to drop index when dropping table
    drop_table :notes
  end
end
