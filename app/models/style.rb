class Style < ActiveRecord::Base
  before_save :send_new_style_notification

  private
    def send_new_style_notification
      Device.all.each do |device|
        NewStyleNotificationWorker.perform_async(device.token)
      end
    end
end