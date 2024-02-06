extends CharacterBody2D

var isCorrect: bool = false

var animations = ["red_bird","yelow_bird","orange_bird","purpple_bird"]
var indice = 0

const SPEED = 200.0

func create(correct):
	isCorrect = correct
	if not isCorrect:
		indice = randi_range(1,3)

func _physics_process(delta):
	velocity.x += SPEED * delta
	$AnimationPlayer.play(animations[indice])
	move_and_slide()

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventScreenTouch and event.pressed:
		get_parent().get_parent().on_bird_capture(isCorrect)
		queue_free()
