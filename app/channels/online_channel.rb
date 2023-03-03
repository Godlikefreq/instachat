class OnlineChannel < Turbo::StreamsChannel
  after_unsubscribe :handle_offline

  def subscribed
    super
    stream_from "OnlineChannel"
    stream_for current_user
    users_online = Kredis.unique_list "users_online"
    users_online << current_user.id
    Turbo::StreamsChannel.broadcast_append_to(
      verified_stream_name_from_params,
      target: "users-list",
      partial: "users/user",
      locals: { user: current_user }
    )
  end

  def unsubscribed
  end

  private

  def handle_offline
    HandleOfflineJob.set(wait_until: Time.zone.now + 5).perform_later(current_user)
  end
end
