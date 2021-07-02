# frozen_string_literal: true

class SessionService
  def self.login(params)
    User.find_by_email(params[:email]).authenticate(params[:password])
  rescue StandardError
    false
  end

  def self.logout
    puts Session.user.refresh_auth_token
  end
end
