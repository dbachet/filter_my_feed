class TweetCollection

  attr_reader :tweets, :search_term, :collection, :case_sensitive

  def initialize(options = {})
    @collection     = @tweets = options[:tweets]
    @search_term    = options[:search_term]
    @case_sensitive = options.fetch(:case_sensitive, false)
  end

  def search
    if !search_term.to_s.empty?
      @collection = @collection.select do |tweet|
        if case_sensitive
          tweet.text[search_term]
        else
          tweet.text.downcase[search_term.downcase]
        end
      end
    end
    self
  end

  def order
    @collection.sort! do |a, b|
      b.user.followers_count <=> a.user.followers_count
    end
    self
  end

  def to_array_of_strings
    @collection.map do |tweet|
      "#{tweet.user.name}: #{tweet.text}"
    end
  end
end