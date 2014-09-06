class Recipe
  attr_reader :description, :instructions, :name, :id
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
  end
end
