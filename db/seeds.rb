require 'open-uri'
require 'json'

json = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
ingredients_list = JSON.parse(json)

ingredients_list['drinks'].each do |ingredient|
  puts "Adding #{ingredient["strIngredient1"]} as a new ingredient..."
  Ingredient.create(name: ingredient["strIngredient1"])
end
