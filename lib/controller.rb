require_relative 'view'
require_relative 'recipe'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # Get all the recipes (cookbook)
    recipes = @cookbook.all
    # Display them (view)
    @view.display(recipes)
  end

  def create
    # Get the name from the user
    recipe_name = @view.ask_the_user_for('name')
    # Get the description from the user
    recipe_description = @view.ask_the_user_for('description')
    # Create the instance of Recipe
    new_recipe = Recipe.new(recipe_name, recipe_description)
    # Add to the cookbook
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # Display all the recipes
    list
    # Ask the user which recipe he wants to delete (index)
    index = @view.ask_index_to_delete
    # Delete the recipe in the cookbook
    @cookbook.delete_recipe(index)
  end

  def mark_as_done
  end
end
