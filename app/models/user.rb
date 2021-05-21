class User < ApplicationRecord

  #Validations
  validates :email, :first_name, :last_name , :auth_token, :role, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  #Callbacks
  after_initialize :generate_auth_token
  after_create :is_recruiter

  enum role: [:professional, :recruiter, :admin]

  def is_recruiter
    unless company_id.present? && role == 1
      self.bio = nil
      self.experience = nil
      self.education = nil
    end
  end

  def generate_auth_token
      self.auth_token = TokenGenerationService.generate unless auth_token.present?
  end
end
