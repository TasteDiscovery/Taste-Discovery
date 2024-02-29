extends Node

class_name MisionService
var ingredientService = IngredientService.new()

const PATH =  "user://mision.cfg"
const SECTION = "mision"

func save_data():
	var config = ConfigFile.new()
	config.set_value(SECTION,"dish",GlobalMision.currentDish)
	config.set_value(SECTION,"finish",GlobalMision.finishGame)
	config.set_value(SECTION,"shoppingListIds",get_shoppingListIds())
	config.save(PATH)

func load_data():
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK: 
		return
	
	GlobalMision.currentDish = config.get_value(SECTION,"dish",GlobalMision.currentDish)
	GlobalMision.finishGame = 	config.get_value(SECTION,"finish",GlobalMision.finishGame)
	GlobalMision.shoppingList = load_shoppingList(config.get_value(SECTION,"shoppingListIds",get_shoppingListIds()))

func delete_data():
	var config = ConfigFile.new()
	var err = config.load(PATH)
	if err != OK: 
		return
	config.clear()
	config.save(PATH)

func get_shoppingListIds():
	var shoppingListIds = []
	for ingredient in GlobalMision.shoppingList:
		shoppingListIds.append(ingredient.Id)
	return shoppingListIds

func load_shoppingList(shoppingListIds):
	var shoppingList = []
	for id in shoppingListIds:
		shoppingList.append(ingredientService.get_by_id(id))
	return shoppingList
