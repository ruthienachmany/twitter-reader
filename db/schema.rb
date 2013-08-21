# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130820190734) do

  create_table "links", :force => true do |t|
    t.string   "shortened_url"
    t.string   "full_url"
    t.datetime "time_posted_at"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "tweet_parsers", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tweets", :force => true do |t|
    t.datetime "tweet_published_at"
    t.string   "tweet_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "twitter_handle"
    t.string   "auth_token"
    t.string   "auth_token_secret"
    t.string   "uid"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "provider"
    t.string   "client_key"
    t.string   "client_secret"
    t.string   "oauth_token"
    t.string   "oauth_verifier"
  end

end
