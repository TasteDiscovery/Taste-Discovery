extends Area2D
class_name Joystick

@onready var range = $Range
@onready var lever = $Lever
@onready var radius = $CollisionShape2D.shape.radius
var distance: float
var direction: Vector2
var index:int  = -1

func _input(event):
	if event is InputEventScreenTouch:
		touch_handler(event)
	if event is InputEventScreenDrag:
		drag_handler(event)

func touch_handler(event):
	if event.is_pressed() and index == -1:
		distance = global_position.distance_to(event.position)
		if distance < radius:
			index = event.index
			lever.global_position = event.position
			direction = (global_position.direction_to(lever.global_position) * distance) / radius
	elif event.index == index:
		index = -1
		lever.position = Vector2.ZERO
		direction = Vector2.ZERO

func drag_handler(event):
	if event.index == index:
		distance = global_position.distance_to(event.position)
		if distance <= radius:
			lever.global_position = event.position
			direction = (global_position.direction_to(lever.global_position) * distance) / radius
		else:
			direction = global_position.direction_to(event.position)
			lever.position = direction * radius
