class YoutubesController < ApplicationController
  
  require 'google/apis/youtube_v3'
  
  GOOGLE_API_KEY = Rails.application.credentials.google[:api_key]

  def find_videos(keyword, after: 1.months.ago, before: Time.now)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = GOOGLE_API_KEY

    next_page_token = nil
    options = {
      q: keyword,
      type: 'video',
      max_results: 10,
      order: :date,
      page_token: next_page_token,
      published_after: after.iso8601,
      published_before: before.iso8601
    }
    youtube.list_searches(:snippet, options)
  end

  def index
    @youtube_data = find_videos('チャンネルガードマン')
  end

end
