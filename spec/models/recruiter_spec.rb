# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recruiter, type: :model do
  describe 'associations' do
    it { should belong_to(:company) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end
