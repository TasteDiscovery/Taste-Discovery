extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var speed: int = 100
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func handleInput():
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = moveDirection * speed

func updateAnimation():
	if velocity.length() == 0:
		anim.stop()
	else:
		var direction = "forward"
		if velocity.x < 0 :direction = "left"
		elif velocity.x > 0 : direction = "right"
		elif velocity.y < 0 : direction = "backward"
		anim.play("walk_" + direction)


func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
	
