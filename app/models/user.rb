# frozen_string_literal: true

class User < ApplicationRecord
  # Validations
  validates :email, :first_name, :last_name, :auth_token, :role, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { message: 'Email Address Already Taken'}
  validates_format_of :first_name, :last_name, with: /\A[^0-9`!@#$%^&*+_=]+\z/
  # Callbacks
  after_initialize :generate_auth_token

  enum role: %i[professional recruiter admin]

  def generate_auth_token
    self.auth_token = TokenGenerationService.generate unless auth_token.present?
  end
end
