# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'of required fields' do
      %i[first_name last_name email auth_token password].each { |attr| should validate_presence_of(attr) }
    end
  end
end
