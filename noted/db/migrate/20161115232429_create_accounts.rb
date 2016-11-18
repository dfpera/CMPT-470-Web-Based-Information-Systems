class CreateAccounts < ActiveRecord::Migration[5.0]
  def up
    create_table :accounts do |t|
      t.string "username", :null => false
      t.string "password", :null => false
      t.string "first_name"
      t.string "last_name"

      t.timestamps
    end
    add_index("accounts", "username")
  end

  def down
    # Don't need to remove index when dropping table
    drop_table :accounts
  end
end
