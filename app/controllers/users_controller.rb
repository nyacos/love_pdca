class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    if user_signed_in?
      # Entry内のuser_idがcurrent_userと同じEntry
      @currentUserEntry = Entry.where(user_id: current_user.id)
      # Entryないのuser_idがMYPAGEのparams.idと同じEntry
      @userEntry = Entry.where(user_id: @user.id)
      # @user.idとcurrent_user.idが同じでなければ
      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            # もしcurrent_user側のルームidと@user側のルームidが同じであれば存在するルームに飛ぶ
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end
        #ルームが存在していなければルームとエントリーを作成する
        unless @isRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end
end
