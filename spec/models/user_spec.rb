require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it "validate presence of required fields" do
      [:first_name, :last_name, :email].each { |attr| should validate_presence_of(attr)}
    end
=begin
    it "validate relations" do
      should have_many(:posts)
    end
=end
  end
end
