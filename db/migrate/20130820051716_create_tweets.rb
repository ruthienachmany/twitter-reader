class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.datetime   :tweet_published_at
      t.string     :tweet_id

      t.timestamps
    end
  end
end

