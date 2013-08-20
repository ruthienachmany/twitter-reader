class FixLinkColumnName < ActiveRecord::Migration
  
  def change
    rename_column :links, :twitter_url, :shortened_url
  end

end
