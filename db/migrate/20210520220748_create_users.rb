# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      # Personal Data
      t.string :first_name
      t.string :last_name
      t.string :email
      # Professional Data
      t.text :bio
      t.text :experience
      t.text :education
      # Recruiter Data
      t.belongs_to :company, foreign_key: true, default: nil, optional: true
      # General
      t.string :auth_token
      t.integer :role, default: 0
      t.timestamps
    end
  end
end
