# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Company, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      [:name].each { |attr| should validate_presence_of(attr) }
    end
    it 'validate relations' do
      should have_many(:recruiter)
    end
  end
end
