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

  def self.company_jobs
    @company_jobs = Company.find(Session.user.company_id).jobs
  end

  def self.belongs_to_company?(job)
    Session.user.company_id == job.company_id
  end

end
