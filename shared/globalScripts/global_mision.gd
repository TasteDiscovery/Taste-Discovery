extends Node

var dishes = []
var currentDish = 0
var finishGame = false
var shoppingList = []
var ingredientService = IngredientService.new()
var dishService = DishService.new()	

var difficulties = ["Facíl", "Normal", "Dificil"]

var difficulty = difficulties[0]

func _ready():
	randomize()
	var ingredients = await ingredientService.get_all()
	dishes = await dishService.get_all()

"""Obtiene los ingrediente de cada misión"""
func get_ingredients():
	return dishes[currentDish].Ingredients

"""Obtiene los ingredientes disponibles en cada zona del mapa"""
func get_ingredients_by_place_dialog(place: String) -> String:
	var ingredients = ingredientService.get_by_place(place)
	var txt = ""
	for i in range(ingredients.size()):
		var ingredientName = ingredients[i].Name
		if i == 0:
			txt = ingredientName
		elif i == ingredients.size() - 1:
			txt += " y " + ingredientName
		else:
			txt += ", " + ingredientName
	return txt

"""Concatena los ingredientes en un solo string"""
func get_ingredients_dialog():
	var txt = ""
	var ingredients = get_ingredients()
	for i in range(ingredients.size()):
		if i == 0:
			txt = ingredients[i].Name
		elif i == ingredients.size() - 1:
			txt += " y " + ingredients[i].Name
		else:
			txt += ", " + ingredients[i].Name
	return txt

func get_shoopinglist_dialog():
	var txt = ""
	for i in range(shoppingList.size()):
		if i == 0:
			txt = shoppingList[i].Name
		elif i == shoppingList.size() - 1:
			txt += " y " + shoppingList[i].Name
		else:
			txt += ", " + shoppingList[i].Name
	return txt

func already_need_ingredients(place)->bool:
	var ingredients = ingredientService.get_by_place(place)
	for item in shoppingList:
		for ingredient in ingredients:
			if item.Name == ingredient.Name:
				return true
	return false

func get_dish_dialog():
	return dishes[currentDish].Name

func asing_shoping_list():
	if not GlobalPlayer.inMision:
		var ingredients = get_ingredients()
		for ingredient in ingredients:
			shoppingList.append(ingredient)
		GlobalPlayer.inMision = true

func deliver_ingredient(place:String):
	var index = matching_ingredient(place)
	if index >= 0: shoppingList.remove_at(index)

func matching_ingredient(place:String)->int:
	var ingredients = ingredientService.get_by_place(place)
	var deliver = null
	for index in range(shoppingList.size()):
		for ingredient in ingredients:
			if shoppingList[index].Name == ingredient.Name:
				return index
	return -1

func next_level():
	if not finishGame and currentDish == dishes.size():
		finishGame = true
	elif finishGame:
		currentDish = randi_range(0,dishes.size())
	else:
		currentDish += 1
	
