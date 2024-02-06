extends CharacterBody2D

signal selection(hasball)

const SPEED = 400.0

var destination: float
var enabledPress = false
var hasBall = false

@onready var animation = $AnimationPlayer

func set_destination(obj:float):
	destination = obj

func arrived():
	var diff = abs(position.x - destination)
	if diff < 5:
		position.x = destination
		return true
	return false

func move():
	if position.x <  destination:
		velocity.x =  SPEED
	elif position.x > destination:
		velocity.x = -1 * SPEED
	move_and_slide()

func _on_area_2d_input_event(viewport, event, shape_idx):
	if enabledPress and event is InputEventScreenTouch and event.pressed:
		selection.emit(hasBall)

func show_ball():
	animation.play("up")

func enable_press():
	enabledPress = true

func disable_press():
	enabledPress = false

func generate_ball():
	hasBall = true
	$Ball.visible = true

