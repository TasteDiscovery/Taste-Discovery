extends Resource

class_name PlayerData

@export var inMision: bool = false
@export var inventary = []
@export var playerName: String = "Jugador"
@export var inDialog: bool = false
@export var skin: String = "res://shared/skins/default_player.tscn"
@export var skinPreview: String = "res://resource/assets/skins/PlayerOriginal.png"
@export var moneys: int = 0 
@export var skins = [
	{ "sprite": "res://resource/assets/skins/PlayerOriginal.png", "locked": false, "scene":"res://shared/skins/default_player.tscn"},
	{ "sprite": "res://resource/assets/skins/FemalePlayerOriginal.png", "locked": false, "scene":"res://shared/skins/default_female_player.tscn"},
	{ "sprite": "res://resource/assets/skins/Erick.png", "locked": true, "scene":"res://shared/skins/erick_player.tscn"},
]


