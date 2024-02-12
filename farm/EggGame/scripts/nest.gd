extends CharacterBody2D

const SPEED = 300.0
var counter:int = 0
var moveLimit: int = 0
var move:bool = true
var isCorrect = false
var type = 0

func create():
	type = randi_range(0,2)
	if type == 0:
		isCorrect = true
	$Egg.frame = type

func _physics_process(delta):
	if move:
		velocity.x = SPEED
		counter += 1
		arrived()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()

func enable_move():
	move = true
	moveLimit += 40

func arrived():
	if counter == moveLimit:
		move = false
		counter = 0
		moveLimit = 0

func get_isCorrect():
	return isCorrect

func collected():
	$Egg.visible = false
