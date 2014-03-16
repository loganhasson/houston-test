class Api::V1::DevicesController < ApplicationController
  
  def register
    if !params[:application_token]
      render json: { status: "error", message: "Please provide an application token."}
    elsif !Application.find_by(token: params[:application_token])
      render json: { status: "error", message: "Invalid application token."}
    else
      application = Application.find_by(token: params[:application_token])
      if device_id?
        device = Device.find(params[:device_id])
        device.token = params[:device_token]
        device.os_version = params[:os_version]
        if device.save
          render json: { status: "success", device_id: device.id, new_registration: 0 }
        else
          render json: { status: "error", message: "Bad request." }
        end
      else
        device = Device.new(
                 token: params[:device_token],
                 device_type: params[:device_type],
                 os_version: params[:os_version],
                 application: application
               )
        if device.save
          render json: { status: "success", device_id: device.id, new_registration: 1 }
        else
          render json: { status: "error", message: "Bad request." }
        end
      end
    end
  end

  private
    def device_id?
      params[:device_id] && params[:device_id] != ""
    end
end