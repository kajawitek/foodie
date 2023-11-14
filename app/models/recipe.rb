class Recipe < ApplicationRecord
  has_many :ingredients

  validates :title, :instruction, presence: true
  validates :title, uniqueness: true
end
