class Api::V1::StylesController < ApplicationController

  def latest
    if !params[:application_token]
      render json: { status: "error", message: "Please provide an application token."}
    elsif !Application.find_by(token: params[:application_token])
      render json: { status: "error", message: "Invalid application token."}
    elsif Application.find_by(token: params[:application_token])
      render json: { status: "success", new_color: Style.first.color }
    end
  end

end