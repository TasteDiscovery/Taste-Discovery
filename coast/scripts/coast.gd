extends Node2D

@onready var playerSpawner = $PlayerSpawner
@onready var ui = $CanvasLayer/UI

func _ready():
	playerSpawner.create_player(ui.get_joystick())

func _process(delta):
	if not GlobalPlayer.inDialog:
		if GlobalGames.enableMarketGame:
			GlobalGames.select_market_game()
		if GlobalGames.enableFarmGame:
			GlobalGames.select_farm_game()
		if GlobalGames.enableForestGame:
			GlobalGames.select_forest_game()
