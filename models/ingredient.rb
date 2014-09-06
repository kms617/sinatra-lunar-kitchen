class Ingredient
# attr_accessor :ingredients

# def initialize
#   @ingredients = []


# def self.db_connection
#     begin
#       connection = PG.connect(dbname: 'recipes')

#       yield(connection)

#     ensure
#       connection.close
#     end
#   end

#   def ingredients.all
#      query =%Q{SELECT * FROM recipe_info
#                   WHERE id = $1;
#                   }

#          results = db_connection do |conn|
#            conn.exec(query, [id])
#          end

#        results.to_a
#      end
#   end

#   def get_ingredients(recipe)
#       ingredients.each do |ingredient|
#       # - find account that transaction belongs to
#       recipe = recipes.find { |recipe| recipe.id == ingredients.recipe_id }
#       # - push transaction into that account's @transactions array
#       recipe.ingredients << ingredient
#       end
#     recipe.ingredients
#   end

end
