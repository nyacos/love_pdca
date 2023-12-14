namespace :scheduler do
  desc "Send LINE notifications at a specific time daily"
  task send_daily_line_notification: :environment do
    # 指定した時刻に実行するための時間を設定
    scheduled_time = Time.zone.parse("09:00 PM")

    # 現在の日時を取得
    current_time = Time.zone.now

    # 指定した時刻になったらLINEメッセージを送信する条件を確認
    if current_time.hour == scheduled_time.hour && current_time.min == scheduled_time.min
      # LINEのクライアントを初期化
      client = Line::Bot::Client.new do |config|
        config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
        config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
      end

      # メッセージを送信
      message = {
        type: "text",
        text: "最近追加されたActionを紹介します。コメントしてみましょう!!https://lovepdca-2614e9cb3e4f.herokuapp.com/acts/5"
      }

      # すべてのユーザーにメッセージを送信
      User.find_each do |user|
        response = client.push_message(user.line_user_id, message)
        puts response
      end
    else
      puts "まだ指定した時刻ではありません。"
    end
  end
end
