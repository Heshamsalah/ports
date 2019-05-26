class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :token
      t.datetime :token_created_at
      t.datetime :token_expires_at

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
