class CreateTags < ActiveRecord::Migration[5.0]
  def change
    create_table :tags do |t|
      t.integer :UID
      t.integer :noteID
      t.string :tagName
      t.boolean :pinned

      t.timestamps
    end
  end
end
