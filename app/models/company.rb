# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :recruiter
  has_many :jobs
  validates :name, :description, presence: true
end
