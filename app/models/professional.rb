# frozen_string_literal: true

class Professional < User
  default_scope { where(company_id: nil) }
  # Relations
  has_many :applications, foreign_key: :user_id

  validates :company, presence: false
end
