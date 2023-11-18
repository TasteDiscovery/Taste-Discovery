extends Node2D


func _ready():
	DialogueManager.show_example_dialogue_balloon(load("res://Scenes/Market/Dialog/market_dialog_main.dialogue"),"init_map")



