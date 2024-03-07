extends CharacterBody2D

signal eggColeccted(collected:bool)

var hasFruit = false

var done = true
var enableselect: bool = false

func order_food():
	hasFruit = true
	$ImageDialog.visible = true
	done = false
	$Waiting.start()

func _input(event):
	var eggs = get_parent().eggs
	if event.is_action_pressed("ui_accept") and enableselect and hasFruit and eggs<3:
		hasFruit = false
		$ImageDialog.visible = false
		$Cooldown.start()
		eggColeccted.emit(true)
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
	eggColeccted.emit(false)

func reset_status():
	hasFruit = false
	$ImageDialog.visible = false
