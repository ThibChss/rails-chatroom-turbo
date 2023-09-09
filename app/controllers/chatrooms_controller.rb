class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @messages = @chatroom.messages.order(created_at: :desc)
    @message = Message.new
    @chatroom.messages?(current_user).update(viewed: true)
  end
end
