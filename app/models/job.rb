class Job < ApplicationRecord
  belongs_to :company
  enum seniority: %i[noexp internship junior semi-senior senior]
end
