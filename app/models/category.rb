class Category < ApplicationRecord
  belongs_to :division
  has_many :company_skills, dependent: :destroy
end
