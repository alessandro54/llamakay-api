# frozen_string_literal: true

class Recruiter < User
  # Relations
  belongs_to :company
  # Validations
  validates :company_id, presence: true
  # Callbacks
  after_initialize :clear_recruiter_params

  private

  def clear_recruiter_params
    self.bio = nil
    self.experience = nil
    self.education = nil
    self.role = 'recruiter'
  end
end
