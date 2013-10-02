class TweetWorker
  include Sidekiq::Worker
  def perform(tweet_id)
    p tweet = Tweet.find(tweet_id)
    user = tweet.user
    p "user #{user}, #{user.id}, #{user.oauth_token}, #{user.oauth_secret}"

    # jake = Twitter::Client.new(oauth_token: user.oauth_token,
    #                            oauth_token_secret: user.oauth_secret)
    Twitter.configure do |config|
      config.oauth_token = user.oauth_token
      config.oauth_token_secret = user.oauth_secret
    end
    Twitter.update(tweet.text)
  end
end
