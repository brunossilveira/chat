class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params['room_id']}_channel"
  end

  def unsubscribed
  end

  def speak(data)
    current_user.messages.create!(body: data['message'], room_id: data['room_id'])
  end
end
