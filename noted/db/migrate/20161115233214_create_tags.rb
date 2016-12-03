class CreateTags < ActiveRecord::Migration[5.0]
  def up
    create_table :tags do |t|
      t.integer "account_id"
      t.string "tag_name"
      t.boolean "pinned", :default => false

      t.timestamps
    end
    add_index("tags", ["tag_name", "account_id"], unique: true)
    add_index("tags", "account_id")
  end

  def down
    drop_table :tags
  end
end
