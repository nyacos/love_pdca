class RoomsController < ApplicationController
  helper_method :current_user
  def index
    @user = current_user
    @currentEntries = current_user.entries
    # @currentEntriesのルームを配列にする
    myRoomIds = []
    @currentEntries.each do |entry|
      myRoomIds << entry.room.id
    end
    # @currentEntriesのルームかつcurrent_userでないEntryを新着順で取ってくる
    @anotherEntries = Entry.where(room_id: myRoomIds).where.not(user_id: @user.id).order(created_at: :desc)
  end

  def show
    @room = Room.find(params[:id])
    # ルームが作成されているかどうか
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @direct_messages = @room.direct_messages
      @entries = @room.entries
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    current_user = User.find(session[:user_id])
    @room = Room.create(:name => "DM")
    # entryにログインユーザーを作成
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    # entryにparamsユーザーを作成
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to room_path(@room.id)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
    redirect_to users_rooms_path
  end
end

private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end