class User < ApplicationRecord
  before_create :generate_nickname

  has_many :messages, dependent: :destroy

  def still_connected?

    still_there = OnlineChannel.broadcast_to(self, action: 'presence-check')

    return true if still_there.is_a?(Integer) && still_there.positive?

    false
  end

  def set_offline
    Turbo::StreamsChannel.broadcast_remove_to("online_users", target: "user_#{self.id}")
  end

  private

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end
end
