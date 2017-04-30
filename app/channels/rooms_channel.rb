require 'subscribers'

class RoomsChannel < ApplicationCable::Channel
  def subscribed
    room_id = params['room_id']

    stream_from "room_#{room_id}_channel"

    Subscribers.add(room_id, current_user.email)

    ActionCable.server.broadcast "room_#{params['room_id']}_channel", { users: Subscribers.list(room_id) }
  end

  def unsubscribed
    room_id = params['room_id']

    Subscribers.remove(room_id, current_user.email)

    ActionCable.server.broadcast "room_#{params['room_id']}_channel", { users: Subscribers.list(room_id) }
  end

  def speak(data)
    MessageBroadcastJob.perform_later(data, current_user.id)
  end
end
