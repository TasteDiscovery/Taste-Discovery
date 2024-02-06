extends Node

var enableMarketGame = false
var enableFarmGame = false
var enableForestGame = false

var marketGames = [
	"res://market/glassGame/scenes/glass_game_intro.tscn",
]

var farmGames = [
	"res://farm/cowGame/scenes/hungry_cows_game_intro.tscn",
]

var forestGames = [
	"res://forest/scenes/find_the_apple_game_intro.tscn",
]

func select_market_game():
	get_tree().change_scene_to_file(marketGames.pick_random())

func select_farm_game():
	get_tree().change_scene_to_file(farmGames.pick_random())

func select_forest_game():
	get_tree().change_scene_to_file(forestGames.pick_random())
