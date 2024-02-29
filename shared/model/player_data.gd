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
	{ "sprite": "res://resource/assets/skins/PlayerOriginal.png", "locked": false, "price": 0, "scene":"res://shared/skins/default_player.tscn"},
	{ "sprite": "res://resource/assets/skins/FemalePlayerOriginal.png", "locked": false, "price": 0, "scene":"res://shared/skins/default_female_player.tscn"},
	{ "sprite": "res://resource/assets/skins/Erick.png", "locked": true, "price": 150, "scene":"res://shared/skins/erick_player.tscn"},
	{ "sprite": "res://resource/assets/skins/FemaleStreetWay.png", "locked": true, "price": 150, "scene":"res://shared/skins/female_streetway_player.tscn"},
	{ "sprite": "res://resource/assets/skins/MaleSport.png", "locked": true, "price": 300, "scene":"res://shared/skins/male_sport_player.tscn"},
	{ "sprite": "res://resource/assets/skins/FemaleSport.png", "locked": true, "price": 300, "scene":"res://shared/skins/female_sport_player.tscn"},
	{ "sprite": "res://resource/assets/skins/FemalePrincess.png", "locked": true, "price": 600, "scene":"res://shared/skins/female_princess_player.tscn"},
	{ "sprite": "res://resource/assets/skins/MaleKnight.png", "locked": true, "price": 600, "scene":"res://shared/skins/male_knight_player.tscn"},
	{ "sprite": "res://resource/assets/skins/FemaleElegant.png", "locked": true, "price": 900, "scene":"res://shared/skins/female_elegant_player.tscn"},
	{ "sprite": "res://resource/assets/skins/MaleElegant.png", "locked": true, "price": 900, "scene":"res://shared/skins/male_elegant_player.tscn"},
]


