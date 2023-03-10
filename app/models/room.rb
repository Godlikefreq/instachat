class Room < ApplicationRecord
  before_create :generate_token
  after_create_commit { broadcast_append_to "rooms" }

  has_many :messages, dependent: :destroy

  def to_param
    token
  end

  private

  def generate_token
    self.token = SecureRandom.hex(2)
  end
end
