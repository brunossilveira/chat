module FlashesHelper
  def user_facing_flashes
    flash.to_hash.slice('alert', 'error', 'notice', 'success')
  end

  def flash_class(level)
    return :danger if level == 'alert'
    return :info if level == 'notice'

    level
  end
end
