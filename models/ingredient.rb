class Ingredient
  attr_reader :name

  def initialize(result)
    @name = result["ingredients"]
  end



end


# self.find { |recipe| recipe.id == ingredients.recipe_id }
#       recipe.ingredients << ingredient
