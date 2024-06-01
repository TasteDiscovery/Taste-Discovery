extends Node
class_name IngredientService

var ingredients = [
	Ingredient.new(0,"limón", "Costa", "Forest"),
	Ingredient.new(1,"pescado", "Costa", "Market"),
	Ingredient.new(2,"lechuga", "Costa", "Farm"),
	Ingredient.new(3,"papa", "Costa", "Farm"),
	Ingredient.new(4,"aji amarillo", "Costa", "Forest"),
	Ingredient.new(5,"aceite", "Costa", "Market"),
	Ingredient.new(6,"sal", "Costa", "Market"),
	Ingredient.new(7,"pollo", "Costa", "Farm"),
	Ingredient.new(8,"maiz morado", "Costa","Forest"),
	Ingredient.new(9,"azucar", "Costa", "Market"),
	Ingredient.new(10,"piña", "Costa", "Forest"),
	Ingredient.new(11,"canela", "Costa", "Farm"),
	Ingredient.new(12,"clavo de olor", "Costa", "Market"),
	Ingredient.new(13,"olluco", "Costa", "Forest"),
	Ingredient.new(14,"charqui", "Costa", "Farm"),
	Ingredient.new(15,"ajo", "Costa", "Farm"),
	Ingredient.new(16,"cebolla", "Costa", "Forest"),
	Ingredient.new(17,"arroz", "Costa", "Market"),
	Ingredient.new(18,"leche", "Costa", "Farm"),
	Ingredient.new(19,"huevo", "Costa", "Farm"),
	Ingredient.new(20,"escencia de vainilla", "Costa", "Market")
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

func get_by_id(id)->Ingredient:
	for ingredient in ingredients:
		if ingredient.Id == id:
			return ingredient
	return null
