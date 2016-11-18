class CreateNotes < ActiveRecord::Migration[5.0]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :text
      t.references :account, index: true

      t.timestamps
    end
    add_foreign_key :notes, :accounts
  end
end
