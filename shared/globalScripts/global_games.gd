extends Node

var enableMarketGame = false
var enableFarmGame = false
var enableForestGame = false

var previewMarketGame = ""
var previewFarmGame = ""
var previewForestGame = ""

var marketGames = [
	"res://market/glassGame/scenes/glass_game_intro.tscn",
	"res://market/birdsGame/scenes/birds_game_intro.tscn"
]

var farmGames = [
	"res://farm/cowGame/scenes/hungry_cows_game_intro.tscn",
	"res://farm/EggGame/Scenes/egg_game_intro.tscn"
]

var forestGames = [
	"res://forest/scenes/find_the_apple_game_intro.tscn",
	"res://forest/fruits_game/scenes/fruit_game_intro.tscn"
]

func select_market_game():
	var game = previewMarketGame
	var i:int = 0
	while game == previewMarketGame and i < 10:
		game = marketGames.pick_random()
		i+=1
	previewMarketGame = game
	get_tree().change_scene_to_file(game)

func select_farm_game():
	var game = previewFarmGame
	var i:int = 0
	while game == previewFarmGame and i < 10:
		game = farmGames.pick_random()
		i+=1
	previewFarmGame = game
	get_tree().change_scene_to_file(game)

func select_forest_game():
	var game = previewForestGame
	var i:int = 0
	while game == previewForestGame and i < 10:
		game = forestGames.pick_random()
		i+=1
	previewForestGame = game
	get_tree().change_scene_to_file(game)
