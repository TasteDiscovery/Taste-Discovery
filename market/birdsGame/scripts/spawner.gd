extends Area2D

@onready var birdScene = load("res://market/birdsGame/scenes/bird.tscn")

func start():
	$Cooldown.autostart = true
	$Cooldown.start()

func stop():
	$Cooldown.autostart = false
	$Cooldown.stop()

func spawn():
	var selector = randi_range(0,1)
	if selector == 0:
		spawn_birds(true)
	else: 
		spawn_birds(false)

func spawn_birds(correct:bool):
	var bird = birdScene.instantiate()
	bird.position = Vector2(0,randi_range(50,600))
	bird.create(correct)
	add_child(bird)

func _on_cooldown_timeout():
	spawn()
