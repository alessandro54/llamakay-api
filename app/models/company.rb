class Company < ApplicationRecord
  has_many :recruiter
  validates :name, :description, presence: true
end
