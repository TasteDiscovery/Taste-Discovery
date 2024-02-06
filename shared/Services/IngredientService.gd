extends Node
class_name IngredientService

var ingredients = [
	Ingredient.new("limon", "Costa", "Forest"),
	Ingredient.new("pescado", "Costa", "Market"),
	Ingredient.new("lechuga", "Costa", "Farm"),
	Ingredient.new("papa", "Costa", "Market"),
	Ingredient.new("aji amarillo", "Costa", "Market"),
	Ingredient.new("aceite", "Costa", "Market"),
	Ingredient.new("sal", "Costa", "Market"),
	Ingredient.new("pollo", "Costa", "Market"),
	Ingredient.new("maiz morado", "Costa", "Market"),
	Ingredient.new("azucar", "Costa", "Market"),
	Ingredient.new("piña", "Costa", "Market"),
	Ingredient.new("canela", "Costa", "Market"),
	Ingredient.new("clavo de olor", "Costa", "Market"),
	Ingredient.new("olluco", "Costa", "Market"),
	Ingredient.new("charqui", "Costa", "Market"),
	Ingredient.new("ajo", "Costa", "Market"),
	Ingredient.new("cebolla", "Costa", "Market"),
	Ingredient.new("arroz", "Costa", "Market"),
	Ingredient.new("leche", "Costa", "Market"),
	Ingredient.new("huevo", "Costa", "Market"),
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
