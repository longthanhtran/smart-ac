class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, limit: 255, null: false, index: { unique: true, name: 'users_email_idx' }
      t.string :password_digest
      t.string :reset_token

      t.timestamps
    end
  end
end
