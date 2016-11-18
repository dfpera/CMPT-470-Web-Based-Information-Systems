class CreateNotesTags < ActiveRecord::Migration[5.0]
  def up
    create_table :notes_tags, :id => false do |t|
      t.integer "note_id"
      t.integer "tag_id"
    end
    add_index("notes_tags", ["note_id", "tag_id"])
  end

  def down
    # Don't need to remove indexes when dropping table
    drop_table :notes_tags
  end
end
