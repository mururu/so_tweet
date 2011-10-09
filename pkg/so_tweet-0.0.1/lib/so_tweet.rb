require 'oauth'
require 'rubytter'

$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module SoTweet
  VERSION = '0.0.1'

  class User
    def initialize(consumer_key,consumer_secret,access_token,access_token_secret)
      consumer = OAuth::Consumer.new(consumer_key,consumer_secret,:site=>'https://api.twitter.com')
      oauth_token = OAuth::AccessToken.new(consumer,access_token,access_token_secret)
      @user = OAuthRubytter.new(oauth_token)
    end

    def tweet(text)
      text.length > 140 ? @user.update(text[0,140]) : @user.update(text)
    end
  end
end
