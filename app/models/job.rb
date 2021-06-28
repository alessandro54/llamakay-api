class Job < ApplicationRecord
  belongs_to :company
  has_many :applications
  enum seniority: %i[noexp internship junior semi-senior senior]
end
