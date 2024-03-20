extends CharacterBody2D

const SPEED = 400.0

signal trapped_player()

@export var chase: bool = false
@export var player: Node2D
@onready var navAgent := $NavigationAgent2D as NavigationAgent2D

func _physics_process(delta):
	if chase:
		var next_path_pos := navAgent.get_next_path_position()
		var dir := global_position.direction_to(next_path_pos)
		velocity = dir * SPEED
		animation(velocity.x)
	else:
		velocity = Vector2.ZERO
		animation(0)
	
	move_and_slide()

func animation(direction: float):
	var sprite = $Sprite2D
	var animationPlayer = $AnimationPlayer
	if direction > 0:
		sprite.flip_h = false
		animationPlayer.play("run")
	elif direction < 0:
		sprite.flip_h = true
		animationPlayer.play("run")
	else:
		animationPlayer.play("RESET")

func make_path():
	navAgent.target_position = player.global_position

func _on_timer_timeout():
	make_path()

func enable_chase():
	$Timer.autostart = true
	$Timer.start()
	chase = true
	$CollisionShape2D.disabled = false

func is_chasing():
	return chase

func disable_chase():
	$Timer.autostart = false
	$Timer.stop()
	chase = false
	$CollisionShape2D.disabled = true

func _on_player_detector_body_entered(body):
	if body.get_name().contains('Player') and chase:
		trapped_player.emit()

func roar():
	$Roar.play()
