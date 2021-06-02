# frozen_string_literal: true

class Recruiter < User
  # Callbacks
  after_initialize :clear_professional_params

  private

  def clear_recruiter_params
    self.bio = nil
    self.experience = nil
    self.education = nil
    self.role = 'recruiter'
  end
end
