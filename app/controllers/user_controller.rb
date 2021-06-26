# frozen_string_literal: true

class UserController < ApplicationController
  before_action :authenticate_user!, only: %i[show update delete]

  def show
    @user = User.find(Session.user.id).decorate
    render json: @user.sanitize!
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: { token: @user.auth_token }, status: :created
    else
      render json: { errors: @user.errors }, status: :unprocessable_entity
    end
  end

  def update
    render json: { message: Session.user }
  end

  def delete
    @user = Session.user
    render json: { message: "Deleted #{@user}" }, status: :accepted
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role, :company_id)
  end
end
