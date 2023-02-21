class MessagesController < ApplicationController
  before_action :set_room, only: %i[ create ]

  def create
    @new_message = @room.messages.build(msg_params)
    @new_message.user = current_user
    @new_message.save
  end

  private

  def msg_params
    params.require(:message).permit(:body)
  end

  def set_room
    @room = Room.find_by(:token => params[:room_token])
  end
end