class CreateTags < ActiveRecord::Migration[5.0]
  def up
    create_table :tags do |t|
      t.string "tag_name"
      t.boolean "pinned"

      t.timestamps
    end
  end

  def down
    drop_table :tags
  end
end
