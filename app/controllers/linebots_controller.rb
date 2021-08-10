class LinebotsController < ApplicationController
  
#   # app.rb
# # require 'sinatra'
# require 'line/bot'

# def client
#   @client ||= Line::Bot::Client.new { |config|
#     config.channel_id = ENV["LINE_CHANNEL_ID"]
#     config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
#     config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
#   }
# end


# post '/callback' do
#   body = request.body.read

#   signature = request.env['HTTP_X_LINE_SIGNATURE']
#   unless client.validate_signature(body, signature)
#     error 400 do 'Bad Request' end
#   end

#   events = client.parse_events_from(body)
#   events.each do |event|
#     case event
#     when Line::Bot::Event::Message
#       case event.type
#       when Line::Bot::Event::MessageType::Text
#         message = {
#           type: 'text',
#           text: event.message['text']
#         }
#         client.reply_message(event['replyToken'], message)
#       when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
#         response = client.get_message_content(event.message['id'])
#         tf = Tempfile.open("content")
#         tf.write(response.body)
#       end
#     end
#   end

#   # Don't forget to return a successful response
#   "OK"
#   # render json: user, status: 200
#   # def response_success(class_name, action_name)
#   #   render status: 200, json: { status: 200, message: "Success #{class_name.capitalize} #{action_name.capitalize}" }
#   # end
# end


  require 'line/bot'
  
  protect_from_forgery with: :null_session

  before_action :validate_signature

  def validate_signature
    body = request.body.read
    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      error 400 do 'Bad Request' end
    end
  end

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      # ローカルで動かすだけならベタ打ちでもOK
      # config.channel_secret = "your channel secret"
      # config.channel_token = "your channel token"
    }
  end
  
  def callback
    body = request.body.read
    events = client.parse_events_from(body)

    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            text: event.message['text']
          }
          client.reply_message(event['replyToken'], message)
        when Line::Bot::Event::MessageType::Image, Line::Bot::Event::MessageType::Video
          response = client.get_message_content(event.message['id'])
          tf = Tempfile.open("content")
          tf.write(response.body)
        end
      end
    }
    "OK"
  end
  
end

# The bot server must return status code 200 after it receives the HTTP POST request sent from the LINE Platform.
