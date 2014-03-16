class Api::V1::NotificationsController < ApplicationController
  def new
    if !params[:application_token]
      render json: { status: "error", message: "Please provide an application token."}
    else
      Device.all.each do |device|
        AlertNotificationWorker.perform_async(device.token, params[:message])
      end

      render json: { status: "success" }
    end
  end
end