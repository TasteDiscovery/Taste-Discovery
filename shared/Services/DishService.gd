extends Node

class_name DishService

var ingredientService = IngredientService.new()
var dishes = [
	Dish.new("ceviche",get_ingredients(["limón","pescado","lechuga"])),
	Dish.new("causa rellena",get_ingredients(["papa","aceite","sal","pollo"])),
	Dish.new("mazamorra",get_ingredients(["maiz morado","azucar","piña","canela","clavo de olor"])),
	Dish.new("olluco con charqui",get_ingredients(["olluco","charqui","ajo","cebolla","aji amarillo"])),
	Dish.new("arroz con leche",get_ingredients(["arroz","leche","azucar","canela"])),
	Dish.new("suspiro a la limeña",get_ingredients(['leche', 'azucar', 'huevo', 'escencia de vainilla']))
]

func get_ingredients(names:Array):
	var ingredients = []
	for name in names:
		ingredients.append(ingredientService.get_by_name(name))
	return ingredients

func get_all():
	return dishes
