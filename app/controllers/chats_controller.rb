class ChatsController < ApplicationController
  def index
    @messages = Chat.latest_messages(10)
  end
  
  def new_message
    # メッセージの受信とブロードキャスト
    message = params[:message]
    ActionCable.server.broadcast 'chat_channel', { message: message }
    head :ok 
  end
end
