class UserDecorator < Draper::Decorator
  delegate_all

  def professional?
    return self.role == 'professional' && self.company_id.nil?
  end

  def recruiter?
    !self.professional?
  end

  def sanitize!
    if self.professional?
      self.bio = ''
      self.experience = ''
      self.education = ''
    end
    self.as_json.compact
  end
end
