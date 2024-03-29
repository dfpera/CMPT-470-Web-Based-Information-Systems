class CreateAccounts < ActiveRecord::Migration[5.0]
  def up
    create_table :accounts do |t|
      t.string "username"
      t.string "password_digest"

      t.timestamps
    end
    add_index("accounts", "username")
  end

  def down
    drop_table :accounts
  end
end
