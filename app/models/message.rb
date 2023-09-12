class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
  scope :unviewed, -> { where(viewed: false) }

  # Send message to all users in the chatroom
  after_create_commit do
    chatroom.users.each do |user|
      broadcast_prepend_to  "broadcast_to_user_#{user.id}",
                            target: "messages_#{chatroom.id}",
                            partial: "messages/message",
                            locals: { user:, message: self }
    end
  end

  # Display the notification count whenever a message is sent
  after_commit do
    chatroom.users.excluding(user).each do |user|
      broadcast_replace_to  "broadcast_to_user_#{user.id}",
                            target: "notifications_count_#{chatroom.id}",
                            partial: "shared/notifications",
                            locals: { count: chatroom.messages?(user).count, chatroom: }
    end
  end

  # Reorder the chatroom list with the last chatroom on top with the latest message
  after_create_commit do
    chatroom.users.each do |user|
      broadcast_update_to "broadcast_to_user_#{user.id}",
                          target: "list_chatrooms_user_#{user.id}",
                          partial: "chatrooms/list_chatrooms",
                          locals: { user:, chatrooms: user.chatrooms.order(updated_at: :desc) }
    end
  end
end
