# frozen_string_literal: true

class UserDecorator < Draper::Decorator
  delegate_all

  def professional?
    role == 'professional' && company_id.nil?
  end

  def recruiter?
    !professional?
  end

  def fresh!
    {
      first_name: first_name,
      last_name: last_name,
      token: auth_token
    }
  end

  def sanitize!
    if professional?
      self.bio = ''
      self.experience = ''
      self.education = ''
    end
    as_json.compact
  end
end
