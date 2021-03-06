class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :body, presence: true, length: { minimum: 2, maximum: 1000 }

  def timestamp
    created_at.strftime('%H:%M:%S %d/%m/%Y')
  end
end
