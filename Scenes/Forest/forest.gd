extends Node2D

@onready var area1 = $Area1/CollisionShape2D
@onready var player = $player
@onready var counter_label = $player/Camera2D/Control/Puntaje

@onready var array_areas = [
	$Area1/CollisionShape2D,
	$Area2/CollisionShape2D,
	$Area3/CollisionShape2D,
	$Area4/CollisionShape2D,
	$Area5/CollisionShape2D,
	$Area6/CollisionShape2D,
	$Area7/CollisionShape2D
]

var total_items = 0
var items_recogidos = 0
var item_searched = "manzana_dorada"
var format_string = "Manzanas doradas: {actual} / {total}"


func gen_random_pos(origin, spawnArea):
	var x = randi_range(origin.x, spawnArea.x)
	var y = randi_range(origin.y, spawnArea.y)
	print(x," - ",y)
	return Vector2(x, y)


# Called when the node enters the scene tree for the first time.
func _ready():
	#spawn_all_section_items()
	if PRINCIPAL_GLOBAL.first_interaction_with_lady:
		primera_charlar_bosque()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_all_section_items():
	for area in array_areas:
		spawn_item(area)
	print(total_items) 
	player.can_interact = false
	counter_label.text = format_string.format({"actual":items_recogidos, "total":total_items })


func spawn_item(area):
	var item = load("res://Scenes/Forest/Items/item_forest.tscn")
	randomize()
	var spawnArea = area.shape.extents
	var origin = area.global_position -  spawnArea
	var rect = area.shape.get_rect()
	var final_point =  Vector2(origin.x + rect.size.x, origin.y + rect.size.y)
	
	
	for i in range(10):
		var instance = item.instantiate()
		instance.position = gen_random_pos(origin, final_point)
		instance.enter_signal.connect(change_caninteract_true)
		instance.out_signal.connect(change_caninteract_false)
		add_child(instance)
		
func change_caninteract_true():
	player.can_interact = true


func change_caninteract_false():
	player.can_interact = false

func get_searched_item():
	return item_searched

func set_items_recogidos():
	items_recogidos = items_recogidos + 1
	counter_label.text = format_string.format({"actual":items_recogidos, "total":total_items })
	if items_recogidos == total_items:
		complete_mision()

func complete_mision():
	PRINCIPAL_GLOBAL.inventary.append(PRINCIPAL_GLOBAL.ingredients.APPLE)

func calculate_total_items(item_name):
	if item_name == item_searched:
		total_items = total_items + 1


####FUNCIONES DE CHARLAR

func primera_charlar_bosque():
	DialogueManager.show_example_dialogue_balloon(load("res://Scenes/Forest/Dialogs/main_forest_dialogs.dialogue"),"first_step_in_forest")

