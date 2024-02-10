extends Area2D

class_name ItemSpawner

@export var fakeQuantity: int = 3
@export var correctQuantity:int = 3

func _ready():
	randomize()
 
func generate():
	generate_correct()
	generate_fake()

func generate_fake():
	for i in range(fakeQuantity):
		create(false)

func generate_correct():
	for i in range(correctQuantity):
		create(true)

func create(correct:bool):
	#Override this
	pass

