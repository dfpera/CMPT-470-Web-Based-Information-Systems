class CreateTags < ActiveRecord::Migration[5.0]
  def up
    create_table :tags do |t|
      t.integer :account_id
      t.integer :note_id
      t.string :tag_name
      t.boolean :pinned

      t.timestamps
    end
    add_index(:tags, :account_id)
    add_index(:tags, :note_id)
  end

  def down
    drop_table :tags
  end
end
