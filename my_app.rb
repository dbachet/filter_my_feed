require_relative "config"
require_relative "lib/tweet_collection"
require "sinatra"

twitter = @twitter
get "/" do
  TweetCollection.new(tweets: twitter.home_timeline, search_term: "on")
    .search
    .order
    .to_array_of_strings
end