extends Node2D

signal selection(hasBall)

@export var glassNumber = 3

var glasses = []
var indices = Vector2(0,0) 
var destinations = Vector2(0,0)
var prev_indices = Vector2(0,0)

@onready var screen_size = get_viewport_rect().size

func set_glass_with_ball():
	var mid_index = int(round(glassNumber / 2))
	glasses[mid_index].generate_ball()

func load_glasses():
	for index in range(glassNumber):
		var width_location = screen_size.x * (index + 1) / (glassNumber + 1)
		var glass = create_glass(width_location)
		glasses.append(glass)

func create_glass(width_location):
	var glass = preload("res://market/glassGame/scenes/glass.tscn").instantiate()
	glass.position = Vector2(width_location, screen_size.y / 2)
	add_child(glass)
	glass.selection.connect(on_selected)
	return glass

func show_ball():
	for glass in glasses:
		glass.show_ball()

func set_glass_destinations():
	destinations.x = glasses[indices.x].position.x
	destinations.y = glasses[indices.y].position.x
	glasses[indices.x].set_destination(destinations.y)
	glasses[indices.y].set_destination(destinations.x)

func verify_indices():
	var revert_indices = Vector2(indices.y, indices.x)
	var equalPrevIndices = (indices == prev_indices)
	var equalReverseIndices = (prev_indices == revert_indices)
	var equalIndices = (indices.x == indices.y)
	
	return not (equalPrevIndices or equalReverseIndices or equalIndices)

func choose_glasses():
	indices.x = randi() % glassNumber
	indices.y = randi() % glassNumber

func chosen_glasses():
	if(verify_indices()):
		prev_indices = indices
		set_glass_destinations()
		return true
	else: 
		return false

func move():
	glasses[indices.x].move()
	glasses[indices.y].move()

func arrived():
	var arrive1 = glasses[indices.x].arrived()
	var arrive2 = glasses[indices.y].arrived()
	return (arrive1 and arrive2)

func enable_press():
	for glass in glasses:
		glass.enable_press()

func disable_press():
	for glass in glasses:
		glass.disable_press()

func on_selected(hasBall):
	selection.emit(hasBall)
