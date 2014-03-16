class Api::V1::DevicesController < ApplicationController
  
  def create
    if !device_params[:application_token]
      render json: { status: "error", message: "Please provide an application token."}
    elsif !Application.find_by(token: params[:application_token])
      render json: { status: "error", message: "Invalid application token."}
    else
      application = Application.find_by(token: params[:application_token])
      device = Device.new(
                 token: params[:device_token],
                 type: params[:type],
                 os_version: params[:os_version],
                 application: application
               )

      if device.save
        render json: { status: "success", device_id: device.id }
      else
        render json: { status: "error", message: "Bad request." }
      end
    end
  end

end