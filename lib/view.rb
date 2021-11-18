class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index} - #{recipe.name} : #{recipe.description}"
    end
  end

  def ask_the_user_for(something)
    puts "What's the #{something}?"
    return gets.chomp
  end

  def ask_index_to_delete
    puts "Which recipe do you want to delete? (index)"
    return gets.chomp.to_i
  end
end
