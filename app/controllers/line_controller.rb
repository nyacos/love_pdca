# app/controllers/line_controller.rb
class LineController < ApplicationController
  protect_from_forgery with: :null_session

  def webhook
    events = params['events']
    
    events.each do |event|
      handle_event(event)
    end

    head :ok
  end

  private

  def handle_event(event)
    case event['type']
    when 'message'
      handle_message(event)
    end
  end

  def handle_message(event)
    case event['message']['type']
    when 'text'
      # ここで新しいコメントが投稿されたかどうかを確認し、新しいコメントがあればLINEに通知を送信する
      new_comment_text = event['message']['text']
      send_line_notification("コメントがつきました！") if new_comment_text.present?
    end
  end

  def send_line_notification(message)
    url = 'https://api.line.me/v2/bot/message/push'
    body = {
      to: ENV['uverthebest'], # 通知を受け取るLINEユーザーのID
      messages: [{ type: 'text', text: message }]
    }

    RestClient.post(url, body.to_json, headers)
  end

  def headers
    {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{ENV['LINE_CHANNEL_ACCESS_TOKEN']}"
    }
  end
end
