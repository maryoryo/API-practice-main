class YoutubesController < ApplicationController
  
  # require 'google/apis/youtube_v3'
  
  # GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

  # def find_videos(keyword, after: 1.months.ago, before: Time.now)
  #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
  #   youtube.key = GOOGLE_API_KEY

  #   next_page_token = nil
  #   options = {
  #     q: keyword,
  #     type: 'video',
  #     max_results: 10,
  #     order: :date,
  #     page_token: next_page_token,
  #     published_after: after.iso8601,
  #     published_before: before.iso8601
  #   }
  #   youtube.list_searches(:snippet, options)
  # end

  # def index
  #   @youtube_data = find_videos('チャンネルガードマン')
  # end
  
  
  # require 'google/apis/youtube_v3'
  
  # GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

  # def list_searches(part)
  #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
  #   youtube.key = GOOGLE_API_KEY

  #   options = {
  #     :channelId => '', #YouTubeチャンネルのIDを指定
  #     :order => "date"
  #   }
    
  #   response = youtube.list_searches(:snippet, options)
    
  #   video_id = response[:items][0][:id][:videoId]
  #   @video_url = "https://www.youtube.com/watch?v=#{video_id}"
  # end

  # def index
  #   @video_url = list_searches(10)
  # end
  
  
  
  
  
  require 'google/apis/youtube_v3'
  
  GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

  # def list_searches(keyword)
  #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
  #   youtube.key = GOOGLE_API_KEY

  #   # keyword = "はなおでんがん" #実際には検索フォームで取得するが、今回は例として”はなおでんがん”をセット
  #   options = {
  #     :q => keyword,   #キーワード検索している想定
  #     :order => "date" #日付順で動画を取得
  #   }
    
  #   youtube.list_searches(:snippet, options)
    
  #   # channel_id = response[:items][0][:snippet][:channelId]
  #   # @channel_url = "https://www.youtube.com/channel/#{channel_id}" #aタグに挿入するURL
  #   # @channel_title = response[:items][0][:channelTitle]            #aタグのテキスト用
  # end
  
  # def index
  #   @youtube_data = list_searches("はなおでんがん")
  # end
  
  
  
  
  
  
  def find_videos(keyword, after: 7.months.ago, before: Time.now)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = GOOGLE_API_KEY
    
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = GOOGLE_API_KEY
    
    keyword = params[:search] #キーワード検索した値を代入
    next_page_token = nil
    opt = {
      q: keyword, #検索クエリで該当するワードを検索
      type: 'video',
      max_results: 10,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    youtube.list_searches(:snippet, opt)
  end

  def index
    @youtubes = find_videos(@keyword)

  end
  
  
  
  
  
  
  
  
  
  # def index
  #   @youtebes = list_searches(params[:keyword])
  #   @keyword = params[:keyword]
  #   render "index"
  # end
  
  
  
  # require 'google/apis/youtube_v3'
  
  # def list_channels
  #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
  #   youtube.key = Rails.application.credentials.google[:api_key]
    
  #   options = {
  #     :id => 'UCPyNsNSTUtywkekbDdCA_8Q' #YouTubeチャンネルのIDを指定
  #   }
    
  #   response = youtube.list_channels("snippet", options)
    
  #   @channel_title = response[:items][0][:snippet][:title]
  # end
  
  # def index
  #   @youtube.list_channels("snippet", options)
  # end
  
  
  
  
  
    # require 'google/apis/youtube_v3'
  
    # GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]
  
    # def list_channels(snippet)
    #   youtube = Google::Apis::YoutubeV3::YouTubeService.new
    #   youtube.key = GOOGLE_API_KEY
  
    #   # keyword = "はなおでんがん" #実際には検索フォームで取得するが、今回は例として”はなおでんがん”をセット
    #   options = {
    #     # :part => snippet,   #キーワード検索している想定
    #     :forUsername => "はなおでんがん"
    #   }
      
    #   youtube.list_channels(:snippet, options)
      
    #   # channel_id = response[:items][0][:snippet][:channelId]
    #   # @channel_url = "https://www.youtube.com/channel/#{channel_id}" #aタグに挿入するURL
    #   # @channel_title = response[:items][0][:channelTitle]            #aタグのテキスト用
    # end
    
    # def index
    #   @youtube_data = list_channels
    # end

  
end
