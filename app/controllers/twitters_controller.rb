class TwittersController < ApplicationController
  
  before_action :twitter_client, only: [:create]
  
  # require 'twitter'
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(create_params)
    if @tweet.save
      @client.update("#{@tweet.content}")
      redirect_to twitters_path
    else
      render 'new'
    end
  end
  
  
  private
  
  def create_params
    params.require(:tweet).permit(:content)
  end
  
  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]    # API Key
      config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"] # API Secret Key
      config.access_token        = ENV["YOUR_ACCESS_TOKEN"]    # Access Token
      config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]   # Access Token Secret
    end
  end


# def tweet
#     client = Twitter::REST::Client.new do |config|
#       # applicationの設定
#       config.consumer_key         = Settings.twitter_key
#       config.consumer_secret      = Settings.twitter_secret
#       # ユーザー情報の設定
#       user_auth = current_user.authentications.first
#       config.access_token         = user_auth.token
#       config.access_token_secret  = user_auth.secret
#     end

#     # Twitter投稿
#     client.update(params[:text])

#     redirect_to root_path, notice: 'ツイートしました！'
#   end
  
  
  # def twitter_client
  #   @client = Twitter::REST::Client.new do |config|
  #     config.consumer_key        = ENV["YOUR_CONSUMER_KEY"]    # API Key
  #     config.consumer_secret     = ENV["YOUR_CONSUMER_SECRET"] # API Secret Key
  #     config.access_token        = ENV["YOUR_ACCESS_TOKEN"]    # Access Token
  #     config.access_token_secret = ENV["YOUR_ACCESS_SECRET"]   # Access Token Secret
  #   end
    
  #   @client.update(params[:content])

  #   redirect_to twitters_path, notice: 'ツイートしました！'
    
  # end
  
  
end
