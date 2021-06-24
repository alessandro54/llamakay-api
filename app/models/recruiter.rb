# frozen_string_literal: true

class Recruiter < User
  default_scope { where.not(company_id: nil) }
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
