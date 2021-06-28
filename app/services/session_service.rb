# frozen_string_literal: true

class SessionService

  def self.login(params)
    if params[:email].present? && params[:password].present?
      User.find_by_email(params[:email]).authenticate(params[:password])
    else
      false
    end
  end

  def self.logout
    puts Session.user.refresh_auth_token
  end
end
