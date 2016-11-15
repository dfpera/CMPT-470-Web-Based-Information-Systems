class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :username
      t.string :password
      t.string :firstName
      t.string :lastName
      t.timestamp :lastUpdated

      t.timestamps
    end
  end
end
