class NewStyleNotificationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(device_token)
    if device = Device.find_by(token: device_token)
      notification = Houston::Notification.new(device: device_token)
      notification.alert = "New Content"
      notification.content_available = true
      notification.custom_data = { endpoint: "styles/latest" }
      APN.push(notification)
    end
  end
end