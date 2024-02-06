extends CharacterBody2D

signal foodDelivered(delivered:bool)

var hungry = false
var hasFood = false

var done = true

@onready var animation = $AnimationPlayer
@onready var dialog = $ImageDialog
@onready var cooldown = $Cooldown
@onready var waiting = $Waiting

func _ready():
	animation.play("idle")

func order_food():
	hungry = true
	animation.play("RESET")
	dialog.visible = true
	done = false
	waiting.start()

func _on_player_detector_body_entered(body):
	var food = get_parent().food
	if body.get_name().contains("Player") and hungry and food > 0:
		hungry = false
		animation.play("eat")
		dialog.visible = false
		cooldown.start()
		foodDelivered.emit(true)
		waiting.stop()

func _on_cooldown_timeout():
	reset_status()
	done = true

func _on_waiting_timeout():
	reset_status()
	cooldown.start()
	foodDelivered.emit(false)

func reset_status():
	hungry = false
	animation.play("idle")
	dialog.visible = false
