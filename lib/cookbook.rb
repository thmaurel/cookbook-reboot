require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file)
    @csv_file = csv_file
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(new_recipe)
    @recipes << new_recipe
    save_csv
  end

  def delete_recipe(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
