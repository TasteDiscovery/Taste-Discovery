extends Node2D

enum {
	SHUFFLE,
	MOVE,
	SELECT,
	SHOW,
	FINISH
}

enum {
	UP,
	DOWN
}

var currentAnimateStatus = UP

var score = 0

var maxRound = 3
var roundCount = 0

var mixNumber = 5
var mixCount = 0

var currentState = SHUFFLE
var glassNumber = 3
var glasses = []
var ball

@onready var screen_size = get_viewport_rect().size
var speed = 300

var indices = Vector2(0,0) 
var destinations = Vector2(0,0)

func _ready():
	load_glasses()
	load_ball()
	set_glass_with_ball()

func get_with_location(index):
	return screen_size.x * (index + 1) / (glassNumber + 1)

func get_mid_index():
	return int(round(glassNumber / 2))
	
func set_glass_with_ball():
	var mid_index = get_mid_index()
	glasses[mid_index].set("hasBall", true)

func load_glasses():
	for i in range(glassNumber):
		var width_location = get_with_location(i)
		var glass = create_glass(width_location)
		glasses.append(glass)

func create_glass(width_location):
	var glass = preload("res://Scenes/Market/Activities/GlassGame/Resource/glass.tscn").instantiate()
	glass.position = Vector2(width_location, screen_size.y / 2)
	glass.z_index = 2
	add_child(glass)
	return glass

func load_ball():
	ball = preload("res://Scenes/Market/Activities/GlassGame/Resource/ball.tscn").instantiate()
	ball.z_index = 1
	add_child(ball)
	ball.position = Vector2(-128,-128)

func choose_glass_indices():
	indices.x = randi() % glassNumber
	indices.y = randi() % glassNumber

func choose_glass_destinations():
	destinations.x = glasses[indices.x].position.x
	destinations.y = glasses[indices.y].position.x

func mix_finished():
	return mixCount >= mixNumber

func choose_glasses():
	choose_glass_indices()
	if(indices.x != indices.y):
		choose_glass_destinations()
		return true
	return false

func choose():
	if mix_finished():
		currentState = SELECT
	elif choose_glasses():
		currentState = MOVE
		mixCount += 1

func _input(event):
	if event_is_glass_selection(event):
		analize_selection(event)

func analize_selection(event):
	var pos = get_event_position(event)
	for glass in glasses:
		if glass_seleted(glass, pos):
			handle_selected_glass(glass)

func get_event_position(event):
	return event.global_position

func event_is_glass_selection(event):
	return currentState == SELECT and event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT

func handle_selected_glass(glass):
	if glass.hasBall:
		handle_correct_glass()
	else:
		handle_incorrect_glass()

func handle_correct_glass():
	print("vaso correcto")
	increment_score()
	finish_round()

func handle_incorrect_glass():
	print("vaso incorrecto")
	decrease_secore()
	finish_round()

func increment_score():
	score += 30
	update_score_label()

func decrease_secore():
	score -= 5
	update_score_label()
	
func update_score_label():
	var scoreLabel = $Control/Puntaje
	scoreLabel.text = "Puntaje: %s" % score

func finish_round():
	set_currentState(SHOW)
	set_ball_position()
	roundCount += 1

func glass_seleted(glass, pos):
	var glassRect = get_glass_rect(glass)
	if glassRect.has_point(pos):
		return true
	return false

func get_glass_rect(glass):
	var glass_x = glass.position.x - 80
	var glass_y = glass.position.y - 100
	var glass_width = glass.get_rect().size.x - 90
	var glass_heigth = glass.get_rect().size.y - 50
	return Rect2(Vector2(glass_x,glass_y),Vector2(glass_width, glass_heigth))

func get_glass_postion_for_ball():
	var posX = glasses[int(round(glassNumber/2))].position.x
	var posY = glasses[int(round(glassNumber/2))].position.y + 60
	return Vector2(posX, posY)

func set_ball_position():
	ball.position = get_glass_postion_for_ball()

#func _draw():
#	for glass in glasses:
#		var rect = get_glass_rect(glass)
#		draw_rect(rect, Color(1, 0, 0, 1),true)

func _process(delta):
	match currentState:
		SHUFFLE:
			choose()
		MOVE:
			swap_glasses_positions(delta)
		SHOW:
			show_ball(delta)
		FINISH:
			pass

func swap_glasses_positions(delta):
	var glass1 = glasses[indices.x]
	var glass2 = glasses[indices.y]
	move_glass(delta, glass1, destinations.y)
	move_glass(delta, glass2, destinations.x)

func move_glass(delta, glass, destination):
	if destination > glass.position.x:
		move_right(delta, glass, destination)
	elif destination < glass.position.x:
		move_left(delta, glass, destination)

func move_right(delta, glass, destination):
	glass.position.x += delta * speed
	if glass.position.x >= destination:
		set_glass_position_x(glass, destination)

func move_left(delta, glass, destination):
	glass.position.x -= delta * speed
	if glass.position.x <= destination:
		set_glass_position_x(glass, destination)

func show_ball(delta):
	match currentAnimateStatus:
		UP:
			move_up(delta)
		DOWN:
			move_down(delta)

func move_up(delta):
	var destination = (screen_size.y/2)-100
	for glass in glasses:
		glass.position.y -= delta * speed
		if glass.position.y <= destination:
			set_glass_position_y(glass, destination)
			currentAnimateStatus = DOWN
		
func move_down(delta):
	var destination = screen_size.y/2
	for glass in glasses:
		glass.position.y += delta * speed
		if glass.position.y >= destination:
			finish_animation(glass, destination)
			
func finish_animation(glass, destination):
	set_glass_position_y(glass, destination)
	restore_ball_position()
	finish_game_or_start_round()

func finish_game_or_start_round():
	if game_finished():
		set_currentState(FINISH)
	else:
		start_new_round()

func game_finished():
	return roundCount>= maxRound

func start_new_round():
	currentAnimateStatus = UP
	set_currentState(SHUFFLE)
	restore_mix_count()

func restore_mix_count():
	mixCount = 0

func restore_ball_position():
	ball.position = Vector2(-128,-128)

func set_glass_position_y(glass, destination):
	glass.position.y = destination

func set_glass_position_x(glass, destination):
	glass.position.x = destination
	set_currentState(SHUFFLE)

func set_currentState(state):
	currentState = state
