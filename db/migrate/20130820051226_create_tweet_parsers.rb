class CreateTweetParsers < ActiveRecord::Migration
  def change
    create_table :tweet_parsers do |t|

      t.timestamps
    end
  end
end
