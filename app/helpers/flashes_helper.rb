module FlashesHelper
  def user_facing_flashes
    flash.to_hash.slice('alert', 'error', 'notice', 'success')
  end

  def flash_class(level)
    return :danger if level == 'alert'

    level
  end
end
