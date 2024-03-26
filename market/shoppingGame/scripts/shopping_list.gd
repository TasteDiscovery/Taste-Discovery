extends Node2D

signal start_challenge()

var fruits = []
@export var quantity: int
@onready var screen_size = get_viewport_rect().size

func create_fruits():
	var location = Vector2(0,screen_size.y / 2)
	for index in range(quantity):
		location.x = screen_size.x * (index + 1) / (quantity + 1)
		create_fruit(location)

func create_fruit(location):
	var fruit = load("res://market/shoppingGame/scenes/fruit.tscn").instantiate()
	fruit.position = location
	fruit.z_index = 1
	add_child(fruit)
	fruits.append(fruit)

func assign_fruits(indices):
	for index in range(quantity):
		fruits[index].create(indices[index])

func _on_button_pressed():
	start_challenge.emit()
