class AlertNotificationWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(device_token, message)
    if device = Device.find_by(token: device_token)
      notification = Houston::Notification.new(device: device_token)
      notification.alert = message
      APN.push(notification)
    end
  end
end