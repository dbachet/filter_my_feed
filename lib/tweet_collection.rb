class TweetCollection

  attr_reader :tweets, :search_term, :collection

  def initialize(options = {})
    @collection = @tweets = options[:tweets]
    @search_term = options[:search_term]
  end

  def search
    if !search_term.to_s.empty?
      @collection = @collection.select do |tweet|
        tweet.text[search_term]
      end
    end
  end

  def order
    @collection = @collection.sort do |a, b|
      b.user.followers_count <=> a.user.followers_count
    end
  end

  def to_array_of_strings
    @collection.map do |tweet|
      "#{tweet.user.name}: #{tweet.text}"
    end
  end
end