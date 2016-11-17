class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.references :account, index: true
      t.references :note, index: true
      t.boolean :pinned

      t.timestamps
    end
    add_foreign_key :tags, :accounts
    add_foreign_key :tags, :notes
  end
end
