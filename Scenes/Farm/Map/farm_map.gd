extends Node2D

@onready var cow_scene = preload("res://Scenes/Farm/NPC/Cow.tscn")
#Vector(x,y)
var positions = [Vector2(300,-550),
	Vector2(180,-450),Vector2(250,-350),
	Vector2(400,-700),Vector2(500,-700),
	Vector2(600,-700)]
	
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 9:
		var cow_instance = cow_scene.instantiate()
		add_child(cow_instance)
		cow_instance.position = Vector2(randi() % 550 + 180,-(randi() % 550 + 10))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
