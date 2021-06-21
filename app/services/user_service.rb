# frozen_string_literal: true

class UserService
  def self.authenticate(request)
    token_format = /Bearer (\w+)/
    auth = request.headers['Authorization']
    if auth.present? && auth.match(token_format)
      token = auth.match(token_format)[1]
      return if (Session.user = User.find_by_auth_token(token))
    end
    raise 'Unauthorized'
  end

  def self.login(email)
    User.find_by_email(email).update_column :auth_token, TokenGenerationService.generate
  end

  def self.logout
    User.find(Session.user).update_column :auth_token, nil
  end
end
