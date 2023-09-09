class PagesController < ApplicationController
  def home
    @chatrooms = current_user.chatrooms.order(updated_at: :desc)
  end
end
