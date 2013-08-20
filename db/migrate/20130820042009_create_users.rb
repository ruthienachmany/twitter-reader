class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :name
      t.string      :twitter_handle
      t.string      :auth_token
      t.string      :auth_token_secret
      t.string      :uid
      t.timestamps
    end
  end
end
