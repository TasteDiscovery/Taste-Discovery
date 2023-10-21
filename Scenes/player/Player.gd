extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
const speed = 100
func handleInput():
	var moveDirection = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	velocity = moveDirection * speed

func updateAnimation():
	if velocity.length() == 0:
		anim.stop()
	else:
		var direction = "back"
		if velocity.x < 0 :direction = "left"
		elif velocity.x > 0 : direction = "right"
		elif velocity.y < 0 : direction = "front"
		anim.play(direction+"_walk")


func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
	


func _on_interact_area_body_entered(body):
	pass # Replace with function body.
