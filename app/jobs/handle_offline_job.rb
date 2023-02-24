class HandleOfflineJob < ApplicationJob
  queue_as :critical

  def perform(user)

    return if user.still_connected?

    users_online = Kredis.unique_list "users_online"
    users_online.remove user.id
    user.set_offline
  end
end