# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy

  validates :title, :instruction, presence: true
  validates :title, uniqueness: true
end
