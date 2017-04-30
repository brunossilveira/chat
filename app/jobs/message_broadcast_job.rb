class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data, user_id)
    current_user = User.find_by_id(user_id)

    translated_message = Messages::Translator.new(data['message'], current_user.dialect).call

    message = current_user.messages.create!(body: translated_message, room_id: data['room_id'])
    ActionCable.server.broadcast "room_#{message.room.id}_channel", message: render_message(message)
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
  end
end
