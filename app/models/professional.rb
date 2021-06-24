# frozen_string_literal: true

class Professional < User
  default_scope { where(company_id: nil ) }
  # Relations
  has_many :job_applications

  validates :company, presence: false
end
