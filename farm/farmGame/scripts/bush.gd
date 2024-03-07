extends CharacterBody2D

signal fruitColeccted(collected:bool)

var hasFruit = false

var done = true
var enableselect: bool = false

func order_food():
	hasFruit = true
	$ImageDialog.visible = true
	done = false
	$Waiting.start()

func _input(event):
	var water = get_parent().water
	if event.is_action_pressed("ui_accept") and enableselect and hasFruit and water>0:
		hasFruit = false
		$ImageDialog.visible = false
		$Cooldown.start()
		fruitColeccted.emit(true)
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
	fruitColeccted.emit(false)

func reset_status():
	hasFruit = false
	$ImageDialog.visible = false
