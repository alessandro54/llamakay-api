# frozen_string_literal: true

class Application < ApplicationRecord
  belongs_to :professional, class_name: 'User', foreign_key: :user_id
  belongs_to :job
end
