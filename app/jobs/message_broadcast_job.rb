class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data, user_id)
    current_user = User.find_by_id(user_id)

    message = current_user.messages.create!(body: data['message'], room_id: data['room_id'])
    ActionCable.server.broadcast "room_#{message.room.id}_channel", message: render_message(message)
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
  end
end
