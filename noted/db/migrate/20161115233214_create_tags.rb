class CreateTags < ActiveRecord::Migration[5.0]
  def up
    create_table :tags do |t|
      t.integer "account_id" # Foreign Key to Accounts Table
      t.string "tag_name"
      t.boolean "pinned", :default => false

      t.timestamps
    end
    add_index("tags", "account_id")
  end

  def down
    # Don't need to remove indexes when dropping table
    drop_table :tags
  end
end
