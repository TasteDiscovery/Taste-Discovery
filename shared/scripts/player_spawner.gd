extends Area2D

@export var horizontal_camera_limits = Vector2(-10000000,10000000)
@export var vertical_camera_limits = Vector2(-10000000,10000000)

@onready var playerScene = load(GlobalPlayer.skin)
var player: PlayerBase

func create_player(joystick:Joystick):
	player = playerScene.instantiate()
	player.z_index = z_index
	player.receive_joystick(joystick)
	set_limit_player_camera()
	add_child(player)

func set_limit_player_camera():
	player.horizontal_camera_limits = horizontal_camera_limits
	player.vertical_camera_limits = vertical_camera_limits
