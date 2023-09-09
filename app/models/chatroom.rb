class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, -> { distinct }, through: :messages

  def messages?(user)
    messages.where.not(user:).unviewed
  end
end
