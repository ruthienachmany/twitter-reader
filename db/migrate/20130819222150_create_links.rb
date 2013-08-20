class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string        :twitter_url
      t.string        :full_url
      t.datetime      :time_posted_at
      t.timestamps
    end
  end
end
