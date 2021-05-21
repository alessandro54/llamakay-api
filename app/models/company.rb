class Company < ApplicationRecord

  validates :name, :description, presence: true
end
