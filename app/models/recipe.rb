class Recipe < ApplicationRecord
  has_many :ingredients
  belongs_to :user

  scope :filter_by_name, -> (name) { where name: name}
  scope :filter_by_cuisine, -> (cuisine) { where cuisine: cuisine}
end
