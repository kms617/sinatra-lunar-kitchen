class Recipe
  attr_reader :name, :id
  attr_accessor :ingredients

  def initialize(result)
    @id = result["id"]
    @name = result["name"]
    @description = result["description"]
    @instructions = result["instructions"]
    @ingredients = []
  end

  def self.db_connection
    begin
      connection = PG.connect(dbname: 'recipes')

      yield(connection)

    ensure
      connection.close
    end
  end

  def self.all
    query= %Q{SELECT * FROM recipes ORDER BY name;}

    results = db_connection do |conn|
      conn.exec('SELECT * FROM recipes ORDER BY name;')
    end

    all_recipes = []
    results.each do |result|
      all_recipes << Recipe.new(result)
    end
    all_recipes
  end

  def self.find(id)
    query = %Q{SELECT * FROM recipes WHERE id = $1;}

    results = db_connection do |conn|
      conn.exec(query, [id])
    end
    results = results.to_a
    Recipe.new(results[0])

  end

  def description
   @description
    if @description == nil
    "This recipe doesn't have a description."
    else
    @description
    end
  end

  def instructions
   @instructions
    if @instructions == nil
    "This recipe doesn't have any instructions."
    else
    @instructions
    end
  end

  def ingredients
    query= %Q{SELECT ingredients.name AS ingredients
              FROM ingredients
              WHERE recipe_id = $1;}

    results = Recipe.db_connection do |conn|
    conn.exec(query, [id])
    end
    results = results.to_a
    all_ingredients = []
    results.each do |result|
      all_ingredients << Ingredient.new(result)
    end

    all_ingredients
  end

# bank_data.each do |row|
#   account = accounts.find {|account| row[:account] == account.name}
#   account.transactions << Transaction.new(row[:date], row[:amount], row[:description])
# end
  # end
end
