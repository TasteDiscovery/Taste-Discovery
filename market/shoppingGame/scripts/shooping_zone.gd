extends Node2D
var fruits = []
var quantity = 32
var sections = 4
@onready var screen_size = get_viewport_rect().size

func _ready():
	create_sections()

func create_sections():
	var section_heigth = (screen_size.y * 3) /4
	var section_heigth_mid = section_heigth / 2
	var location = Vector2(0,section_heigth_mid/2)
	var sectionRowQuantity = (quantity / sections) /2
	
	for section in range(sections):
		create_section(location,sectionRowQuantity,section)

func create_section(location, sectionRowQuantity, section):
	var indice = 0
	for index in range(sectionRowQuantity):
		location.x = (screen_size.x * (index + 1) / (sectionRowQuantity + 1)) + (section * screen_size.x)
		indice = index + section * sectionRowQuantity * 2
		create_fruit(location,indice)
	location.y = location.y * 3
	for index in range(sectionRowQuantity):
		location.x = (screen_size.x * (index + 1) / (sectionRowQuantity + 1)) + (section * screen_size.x)
		indice = (index + sectionRowQuantity)  + section * sectionRowQuantity * 2
		create_fruit(location,indice)

func create_fruit(location, indice):
	var fruit = load("res://market/shoppingGame/scenes/fruit.tscn").instantiate()
	fruit.position = location
	fruit.z_index = 1
	fruit.create(indice)
	add_child(fruit)
	fruits.append(fruit)
