class OnlineChannel < Turbo::StreamsChannel
  after_unsubscribe :handle_offline

  def subscribed
    super
    stream_from "OnlineChannel"
    stream_for current_user
    users_online = Kredis.unique_list "users_online"
    users_online << current_user.id
    current_user.set_online
  end

  def unsubscribed
  end

  private

  def handle_offline
    HandleOfflineJob.set(wait_until: Time.zone.now + 5).perform_later(current_user)
  end
end
