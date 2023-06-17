class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :measurement, inclusion: { in: ['grams', 'ml', 'item/s', 'tbsp', 'cup', 'pinch']}

  MEASUREMENT_OPTIONS = ['grams', 'ml', 'item/s', 'tbsp', 'cup', 'pinch']

end
