# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authenticate_user!, only: %i[logout]

  def login
    if (@user = SessionService.login(session_params))
      render json: { token: @user.auth_token }, status: :ok
    else
      render json: { error: 'Invalid Credentials' }, status: :unauthorized
    end
  end

  def logout
    render json: { message: 'See you later!' }, status: :accepted if SessionService.logout
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
