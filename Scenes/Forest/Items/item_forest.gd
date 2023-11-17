extends Node2D

@onready var image_texture = get_node("Sprite2D")
@onready var player = get_node("res://Scenes/player/Player.tscn")

signal enter_signal
signal out_signal

var player_is_beside = false
var array_items = [
	{ "id": 1, "name": "manzana_dorada" ,"image": preload("res://Assets/Items/manzana_dorada.png")},
	{ "id": 2, "name": "manzana_roja" ,"image": preload("res://Assets/Items/manzana_roja.png")},
	{ "id": 3, "name": "manzana_verde" ,"image": preload("res://Assets/Items/manzana_verde.png")}
]

@export var name_item = ''
var id= 0

# Called when the node enters the scene tree for the first time.
func _ready():
	#random_texture()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#print(PRINCIPAL_GLOBAL.player_current_try_interact, player_is_beside )
	if PRINCIPAL_GLOBAL.player_current_try_interact == true and player_is_beside == true:
		PRINCIPAL_GLOBAL.player_current_try_interact = false
		object_interaction()

func random_texture():
	
	randomize()
	#var index_selected =  randi_range(0,array_items.size() - 1)
	var item_selected = array_items.pick_random()
	image_texture = item_selected.image
	name_item = item_selected.name
	print(name_item)
	get_parent().calculate_total_items(name_item)

func defined_texture(nombre_item):
	var item_selected = buscarPorNombre(nombre_item)
	image_texture.texture = item_selected.image
	name_item = item_selected.name
	id = item_selected.id
	#get_parent().calculate_total_items(name_item)

func buscarPorNombre(nombre_a_buscar: String) -> Dictionary:
	for item in array_items:
		if item["name"] == nombre_a_buscar:
			return item
	return {}

func object_interaction():
	print(name_item)
	print(image_texture.texture)
	if name_item == get_parent().get_searched_item():
		get_parent().set_items_recogidos()
		self.queue_free()

func _on_area_item_forest_body_entered(body):
	player_is_beside = true
	emit_signal("enter_signal")
	print(player_is_beside)


func _on_area_item_forest_body_exited(body):
	player_is_beside = false
	emit_signal("out_signal")
	print(player_is_beside)
