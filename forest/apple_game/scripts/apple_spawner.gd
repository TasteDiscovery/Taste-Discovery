extends ItemSpawner
@export var correctIndice: int = 0
@onready var appleScene = load("res://forest/apple_game/scenes/apple.tscn")

func create(correct:bool):
	var apple = appleScene.instantiate()
	apple.create(correct, correctIndice)
	apple.position = Vector2(randi_range(0,360),randi_range(0,360))
	apple.scale = Vector2(1.5,1.5)
	add_child(apple)
