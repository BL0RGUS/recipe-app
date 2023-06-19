class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :measurement, inclusion: { in: ['grams', 'ml', 'item/s', 'tbsp', 'cup/s', 'pinch/s']}

  MEASUREMENT_OPTIONS = ['grams', 'ml', 'item/s', 'tbsp', 'cup/s', 'pinch/s']

end
