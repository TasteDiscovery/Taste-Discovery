extends CharacterBody2D

signal foodDelivered(delivered:bool)

var hungry = false
var hasFood = false

var done = true
var enableselect: bool = false

func _ready():
	$AnimationPlayer.play("idle")

func order_food():
	hungry = true
	$AnimationPlayer.play("RESET")
	$ImageDialog.visible = true
	done = false
	$Waiting.start()

func _input(event):
	var food = get_parent().food
	if event.is_action_pressed("ui_accept") and enableselect and hungry and food > 0:
		hungry = false
		$AnimationPlayer.play("eat")
		$ImageDialog.visible = false
		$Cooldown.start()
		foodDelivered.emit(true)
		$Waiting.stop()

func _on_player_detector_body_entered(body):
	if body.get_name().contains("Player"):
		enableselect = true

func _on_player_detector_body_exited(body):
	enableselect = false

func _on_cooldown_timeout():
	reset_status()
	done = true

func _on_waiting_timeout():
	reset_status()
	$Cooldown.start()
	foodDelivered.emit(false)

func reset_status():
	hungry = false
	$AnimationPlayer.play("idle")
	$ImageDialog.visible = false
