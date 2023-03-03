class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.all
    @room = Room.new

    users_online = Kredis.unique_list "users_online"
    @users = User.find(users_online.elements)
  end

  def show
    @message = Message.new
    @messages = @room.messages
  end

  def create
    @room = Room.create!

    redirect_to @room, notice: 'Room was successfully created.'
  end

  private

  def set_room
    @room = Room.find_by(token: params[:token])
  end
end
