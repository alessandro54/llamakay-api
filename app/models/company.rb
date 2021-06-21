# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :recruiter
  validates :name, :description, presence: true
end
