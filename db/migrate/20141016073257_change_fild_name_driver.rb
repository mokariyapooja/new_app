class ChangeFildNameDriver < ActiveRecord::Migration
  def change
    rename_column :driver_authentication_tokens, :driver_auth_token, :auth_token
  end
end
