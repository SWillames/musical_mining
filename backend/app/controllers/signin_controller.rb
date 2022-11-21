class SigninController < ApplicationController
  before__action :authorize_access_request!, only: [:destroy]

  def create
    user = User.find_by(email: params[:email])

    if user.authenticate(params[:password])
      payload = { user_id: user.id }
      session = JWTSessions::Session.new(payload: payload, refresh_by_access_allowed: true)
      tokens = session.login
      response.set_cookie(JWTSessions.access_cookie,
                          value: tokens.to_json,
                          httponly: true,
                          secure: Rails.env.production?)
      render json: { crsf: tokens[:crsf] }
    else
      not_authorized
    end
  end

  def destroy
    session = JWTSessions::Session.new(payload: payload)
    session.flush_by_access_payload
    render json: ok
  end

  private

  def not_found
    render json: { error: "User not found" }, status: :not_found
  end
end