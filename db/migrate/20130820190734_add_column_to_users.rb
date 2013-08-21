class AddColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :client_key, :string
    add_column :users, :client_secret, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_verifier, :string

  end
end
