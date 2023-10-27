extends Node2D

@onready var cow_scene = preload("res://Scenes/Farm/NPC/Cow.tscn")
#Vector(x,y)
var positions = [Vector2(180,-400),
	Vector2(360,-500),Vector2(540,-550),
	Vector2(720,-525),Vector2(630,-350),
	Vector2(675,-150),Vector2(360,-300),
	Vector2(360,-100),Vector2(900,-200)]
	
# Called when the node enters the scene tree for the first time.
func _ready():
	for x in 9:
		var cow_instance = cow_scene.instantiate()
		add_child(cow_instance)
		cow_instance.position = positions[x]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
