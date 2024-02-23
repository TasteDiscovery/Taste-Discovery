extends Node

class_name MisionService
var ingredientService = IngredientService.new()
const FILE_NAME =  "mision.tres"

func save_data():
	var misionData = MisionData.new()
	misionData.currentDish = GlobalMision.currentDish
	misionData.finishGame = GlobalMision.finishGame
	misionData.shoppingList = get_shoppingListIds()
	
	ResourceSaver.save(misionData,FILE_NAME)

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

func load_data():
	var misionData = ResourceLoader.load(FILE_NAME)
	
	if misionData == null: 
		return
	
	GlobalMision.currentDish = misionData.currentDish
	GlobalMision.finishGame = misionData.finishGame
	GlobalMision.shoppingList = load_shoppingList(misionData.shoppingList)
