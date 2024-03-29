extends Area2D

@export var horizontal_camera_limits = Vector2(-10000000,10000000)
@export var vertical_camera_limits = Vector2(-10000000,10000000)
@export var camera_zoom = Vector2(1.5,1.5)

@onready var playerScene = load(GlobalPlayer.skin)
var player: PlayerBase

func create_player(joystick:Joystick)->Node2D:
	player = playerScene.instantiate()
	player.position = global_position
	player.z_index = z_index
	player.receive_joystick(joystick)
	set_limit_player_camera()
	if get_parent() != null:
		get_parent().add_child(player)
	else:
		add_child(player)
	return player

func set_limit_player_camera():
	player.camera_zoom = camera_zoom
	player.horizontal_camera_limits = horizontal_camera_limits
	player.vertical_camera_limits = vertical_camera_limits
