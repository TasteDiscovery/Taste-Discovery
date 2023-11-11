extends Node2D

@onready var area1 = $Area1/CollisionShape2D

@onready var array_areas = [
	
]


func gen_random_pos(origin, spawnArea):
	var x = randi_range(origin.x, spawnArea.x)
	var y = randi_range(origin.y, spawnArea.y)
	print(x," - ",y)
	return Vector2(x, y)


# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_items(area1)
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func spawn_items(area):
	var item = load("res://Scenes/Forest/Items/item_forest.tscn")
	randomize()
	var spawnArea = area.shape.extents
	var origin = area.global_position -  spawnArea
	var rect = area.shape.get_rect()
	var final_point =  Vector2(origin.x + rect.size.x, origin.y + rect.size.y)
	
	
	for i in range(5):
		var instance = item.instantiate()
		instance.position = gen_random_pos(origin, final_point)
		add_child(instance)
