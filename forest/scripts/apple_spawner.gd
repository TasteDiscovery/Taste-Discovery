extends Area2D

@export var fakeQuantity = 3
@export var correctQuantity = 3

@onready var appleScene = load("res://forest/scenes/apple.tscn")

func _ready():
	randomize()
 
func generate_apples():
	generate_correct_apples()
	generate_fake_apples()

func generate_fake_apples():
	for i in range(fakeQuantity):
		create_apple(false)

func generate_correct_apples():
	for i in range(correctQuantity):
		create_apple(true)

func create_apple(correct:bool):
	var apple = appleScene.instantiate()
	apple.create(correct)
	apple.position = Vector2(randi_range(0,360),randi_range(0,360))
	apple.scale = Vector2(1.5,1.5)
	add_child(apple)
