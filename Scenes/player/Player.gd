extends CharacterBody2D

@onready var anim = $AnimatedSprite2D
@export var speed = 100
var can_interact = false
var can_move = true

func handleInput():
	if can_move ==false : return
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
	interaction_handle()

func interaction_handle():
	if Input.is_action_just_pressed("interact") and can_interact:
		PRINCIPAL_GLOBAL.player_current_try_interact = true



func _on_interact_area_body_entered(body):
	if body.has_method("npc_interaction"):
		can_interact = true
		
		
	if body.has_method("object_interaction"):
		can_interact = true


func _on_interact_area_body_exited(body):
	if body.has_method("npc_interaction"):
		can_interact = false
	if body.has_method("object_interaction"):
		can_interact = false

