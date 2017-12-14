DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/board.db")

class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, Text
  property :author, String, :default => "익명" #아무것도 안해주면 익명이 들어감
  property :created_at, DateTime
end

class User
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password, String
  property :name, String, :default => ""
  property :story, String, :default => ""
  property :created_at, DateTime
end

DataMapper.finalize

Post.auto_upgrade!
User.auto_upgrade!
