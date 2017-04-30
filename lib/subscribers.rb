require 'storage'

class Subscribers
  BASE_KEY = 'rooms_subscribers'

  def self.add(room, user)
    current_list = list(room)
    current_list << user

    Storage.set(key(room), current_list.to_json)
  end

  def self.remove(room, user)
    current_list = list(room)
    current_list.delete(user)

    Storage.set(key(room), current_list.to_json)
  end

  def self.key(room)
    "#{BASE_KEY}_#{room}"
  end

  def self.list(room)
    list = Storage.get(key(room)) || '[]'

    JSON.parse(list)
  end
end
