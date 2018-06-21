DataMapper::setup(:default, "sqlite://#{Dir.pwd}/twitter.db")

class Tweet
    include DataMapper::Resource
    property :id, Serial
    property :email, String
    property :content, Text
    property :created_at, DateTime
end

class User
    include DataMapper::Resource
    property :id, Serial
    property :email, String
    property :password, String
    property :created_at, String
end


DataMapper.finalize

Tweet.auto_upgrade!
User.auto_upgrade!
