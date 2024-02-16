extends Node

var inMision: bool = false
var inventary = []
var playerName: String = "Jugador"
var inDialog: bool = false
var skin: String = "res://shared/skins/default_player.tscn"
var skinPreview: String = "res://resource/assets/skins/PlayerOriginal.png"
var moneys: int = 0

var skins = [
	{ "sprite": "res://resource/assets/skins/PlayerOriginal.png", "locked": false, "scene":"res://shared/skins/default_player.tscn"},
	{ "sprite": "res://resource/assets/skins/FemalePlayerOriginal.png", "locked": false, "scene":"res://shared/skins/default_female_player.tscn"},
	{ "sprite": "res://resource/assets/skins/Erick.png", "locked": true, "scene":"res://shared/skins/erick_player.tscn"},
]
