# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!, only: %i[show delete]

  def show
    @user = User.find(Current.user.id).decorate
    render json: @user.sanitize!
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    render json: { message: @user }, status: :ok
  end

  def delete
    @user = Current.user
    render json: { message: "Deleted #{@user}" }
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email)
  end

  def authenticate_user!
    token_format = /Bearer (\w+)/
    auth = request.headers['Authorization']
    if auth.present? && auth.match(token_format)
      token = auth.match(token_format)[1]
      return if (Current.user = User.find_by_auth_token(token))
    end
    render json: { message: 'You must provide a token' }, status: :unauthorized
  end
end
