class CreateDriverAuthenticationTokens < ActiveRecord::Migration
  def change
    create_table :driver_authentication_tokens do |t|
      t.integer :driver_id
      t.string  :driver_auth_token
      t.timestamps
    end
  end
end
