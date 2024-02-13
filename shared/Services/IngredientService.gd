extends Node
class_name IngredientService

var ingredients = [
	Ingredient.new("limon", "Costa", "Forest"),
	Ingredient.new("pescado", "Costa", "Market"),
	Ingredient.new("lechuga", "Costa", "Farm"),
	Ingredient.new("papa", "Costa", "Farm"),
	Ingredient.new("aji amarillo", "Costa", "Forest"),
	Ingredient.new("aceite", "Costa", "Market"),
	Ingredient.new("sal", "Costa", "Market"),
	Ingredient.new("pollo", "Costa", "Farm"),
	Ingredient.new("maiz morado", "Costa", "Forest"),
	Ingredient.new("azucar", "Costa", "Market"),
	Ingredient.new("piña", "Costa", "Forest"),
	Ingredient.new("canela", "Costa", "Farm"),
	Ingredient.new("clavo de olor", "Costa", "Market"),
	Ingredient.new("olluco", "Costa", "Forest"),
	Ingredient.new("charqui", "Costa", "Farm"),
	Ingredient.new("ajo", "Costa", "Farm"),
	Ingredient.new("cebolla", "Costa", "Forest"),
	Ingredient.new("arroz", "Costa", "Market"),
	Ingredient.new("leche", "Costa", "Farm"),
	Ingredient.new("huevo", "Costa", "Farm"),
	Ingredient.new("escencia de vainilla", "Costa", "Market")
]

func get_all():
	return ingredients

func get_by_place(place: String) -> Array:
	return ingredients.filter(func(ingredient): return ingredient.Place == place)

func get_by_name(name:String)->Ingredient:
	for ingredient in ingredients:
		if ingredient.Name == name:
			return ingredient
	return null
