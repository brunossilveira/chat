require 'redis'

class Storage
  def self.get(key)
    storage.get(key)
  end

  def self.set(key, value)
    storage.set(key, value)
  end

  def self.storage
    Redis.new(url: ENV.fetch('REDIS_URL'))
  end
end
