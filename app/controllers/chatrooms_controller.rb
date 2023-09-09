class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages.order(created_at: :desc)
    @message = Message.new
    @new_messages = @chatroom.messages?(current_user)
    @new_messages.update(viewed: true)
  end
end
