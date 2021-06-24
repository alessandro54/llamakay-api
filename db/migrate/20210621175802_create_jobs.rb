class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.references :company, null: false, foreign_key: true
      t.text :description
      t.integer :seniority
      t.boolean :active
      t.json :custom_questions

      t.timestamps
    end
  end
end
