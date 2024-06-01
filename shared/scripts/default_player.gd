extends CharacterBody2D

class_name PlayerBase

signal moving()

@export var horizontal_camera_limits = Vector2(-10000000,10000000)
@export var vertical_camera_limits = Vector2(-10000000,10000000)
@export var camera_zoom = Vector2(1,1)

const SPEED = 300.0

var joystick: Joystick
var direction: Vector2

@onready var animation = $AnimatedSprite2D
@onready var camera = $Camera

func _ready():
	camera.limit_left = horizontal_camera_limits.x
	camera.limit_right = horizontal_camera_limits.y
	camera.limit_top = vertical_camera_limits.x
	camera.limit_bottom = vertical_camera_limits.y
	camera.zoom = camera_zoom

func _physics_process(delta):
	if not GlobalPlayer.inDialog:
		move()
	else:
		velocity = Vector2.ZERO
	update_animation()
	move_and_slide()

func move():
	if joystick != null and is_instance_valid(joystick):
		direction = joystick.direction
	else:
		direction = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	
	velocity = direction * SPEED
	if velocity != Vector2.ZERO: moving.emit()

func update_animation():
	if velocity.length() == 0:
		animation.stop()
	else:
		var direction = "down"
		if velocity.x < 0 :direction = "left"
		elif velocity.x > 0 : direction = "right"
		elif velocity.y < 0 : direction = "up"
		animation.play(direction)

func receive_joystick(j):
	joystick = j
