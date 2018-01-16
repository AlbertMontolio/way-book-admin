class CreateCompanySkills < ActiveRecord::Migration[5.0]
  def change
    create_table :company_skills do |t|
      t.string :name
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
