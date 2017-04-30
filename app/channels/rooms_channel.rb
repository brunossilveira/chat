class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_#{params['room_id']}_channel"
  end

  def unsubscribed
  end

  def speak(data)
    MessageBroadcastJob.perform_later(data, current_user.id)
  end
end
