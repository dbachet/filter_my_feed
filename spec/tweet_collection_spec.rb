require "tweet_collection"

RSpec.describe TweetCollection do
  let(:matching_tweet) {
    double("Twitter::Tweet",
           text: "foo bar",
           user: double("Twitter::User",
                        name: "John Doe",
                        followers_count: 15))
  }
  let(:most_user_followers_matching_tweet) {
    double("Twitter::Tweet",
           text: "foo zone",
           user: double("Twitter::User",
                        name: "J. David",
                        followers_count: 30))
  }
  let(:not_matching_tweet) {
    double("Twitter::Tweet",
           text: "bar zone",
           user: double("Twitter::User",
                        name: "Louis",
                        followers_count: 30))
  }
  let(:search_term) { "foo" }
  let(:tweets) { [matching_tweet, not_matching_tweet] }

  subject { TweetCollection.new(tweets: tweets, search_term: search_term) }

  describe "#initialize" do
    specify do
      expect( subject.tweets      ).to eql tweets
      expect( subject.collection  ).to eql tweets
      expect( subject.search_term ).to eql search_term
    end
  end

  describe "#search" do
    context "when search param is nil" do

      before { subject.search }

      let(:search_term) { nil }

      specify do
        expect( subject.collection ).to eql tweets
      end
    end

    context "when search param is empty" do

      let(:search_term) { "" }

      specify do
        expect( subject.collection ).to eql tweets
      end
    end

    context "when search param is foo" do

      let(:search_term) { "foo" }

      before { subject.search }

      context "when there is a matching tweet" do
        let(:collection) { [matching_tweet] }

        specify do
          expect( subject.collection ).to eql collection
        end
      end

      context "when there is no matching tweet" do
        let(:tweets) { [not_matching_tweet] }
        let(:collection) { [] }

        specify do
          expect( subject.collection ).to eql collection
        end
      end
    end
  end

  describe "#order" do
    let(:collection) { [most_user_followers_matching_tweet, matching_tweet] }
    let(:tweets) { [matching_tweet, most_user_followers_matching_tweet] }

    specify do
      subject.order
      expect( subject.collection ).to eql collection
    end
  end

  describe "#to_array_of_strings" do
    let(:array_of_strings) {
      [
        "#{matching_tweet.user.name}: #{matching_tweet.text}",
        "#{not_matching_tweet.user.name}: #{not_matching_tweet.text}"
      ]
    }

    it "should return a collection of strings composed of user name and tweet content" do
      expect( subject.to_array_of_strings ).to eql array_of_strings
    end
  end
end