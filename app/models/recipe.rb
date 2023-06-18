class Recipe < ApplicationRecord
  has_many :recipe_methods
  has_many :ingredients, dependent: :delete_all
  has_many :recipe_methods, dependent: :delete_all
  belongs_to :user

  scope :filter_by_name, -> (name) { where name: name}
  scope :filter_by_cuisine, -> (cuisine) { where cuisine: cuisine}

  scope :filter_by_query, ->(query) {
    return nil  if query.blank?

    terms = query.downcase.split('+')


    terms = terms.map { |e|
    (e.tr("*", "%") + "%").gsub(/%+/, "%")
    }

    num_or_conds = 2
    where(
      terms.map { |_term|
        "(LOWER(recipes.name) LIKE ? OR LOWER(recipes.cuisine) LIKE ?)"
      }.join(" AND "),
      *terms.map { |e| [e] * num_or_conds }.flatten,
    )
  }
  
  scope :filter_by_ingred, ->(ingred) {
    ingred = ingred.split(',')
    request = "((\"" + ingred[0] + "\" IN (SELECT ingredient FROM ingredients WHERE recipes.id = ingredients.recipe_id))"
    for i in 1..ingred.length()-1
      request << " AND (\"" + ingred[i]  + "\" IN (SELECT ingredient FROM ingredients WHERE recipes.id = ingredients.recipe_id))"
    end
    request << ")"
    puts request
    where(request)
  }
end
