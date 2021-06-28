# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  # Validations
  validates :email, :first_name, :last_name, :auth_token, :role, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP },
                    uniqueness: { message: 'Email Address Already Taken' }
  validates_format_of :first_name, :last_name, with: /\A[^0-9`!@#$%^&*+_=]+\z/
  # validates :password, format: { with: /\A(?=.{8,})(?=.*\d)(?=.*[a=Z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x}
  # Callbacks
  after_initialize :generate_auth_token

  enum role: %i[professional recruiter admin]

  def generate_auth_token
    self.auth_token = TokenGenerationService.generate unless auth_token.present?
  end

  def refresh_auth_token
    update_column :auth_token, TokenGenerationService.generate
  end
end
