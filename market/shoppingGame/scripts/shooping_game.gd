extends Node2D

const TIME_PER_ROUND = 30

var section: int = 1
var current_ingredients = []
var shooping_list = []
var quantity = 4
var total_round = 3
var round = 0
var time = TIME_PER_ROUND
var score = 0
var total_time = 0

@onready var screen_size = get_viewport_rect().size

func _ready():
	$ShoppingList.quantity = quantity
	$SelectedFruits.quantity = quantity
	$ShoppingList.create_fruits()
	$SelectedFruits.create_fruits()

func _on_counter_start_game():
	$ShoopingZone.visible = false
	$CanvasLayer/Counter.visible = false
	$ShoppingList.visible = true
	start_round()

func finish_game():
	GlobalGames.enableMarketGame = false
	$CanvasLayer/ScoreBoard.visible = false
	$CanvasLayer/PauseMenu.visible = false
	var percent = (score * 100)/150
	$CanvasLayer/ScoreScreen.result(percent, total_time)
	if percent >= 50:
		GlobalMision.deliver_ingredient("Market")
	$CanvasLayer/ScoreScreen.visible = true

func start_round():
	round += 1
	asing_shooping_List()
	current_ingredients.clear()
	$SelectedFruits.reset()
	reset_time()
	$CanvasLayer/ScoreBoard.update_time(time)

func reset_time():
	time = TIME_PER_ROUND

func finish_round():
	$CanvasLayer/PauseMenu.visible = false
	total_time += (TIME_PER_ROUND - time)
	disable_game_ui()
	next_round()

func disable_game_ui():
	$SelectTimer.stop()
	$CanvasLayer/StoreButtons.visible = false
	$CanvasLayer/GameButtons.visible = false
	$CanvasLayer/ScoreBoard.visible = false
	$CanvasLayer/MusicScreen.visible = false
	$SelectedFruits.visible = false
	$ShoopingZone.visible = false
	$ShoppingList.visible = true

func next_round():
	if round < total_round:
		start_round()
	else:
		finish_game()

func check_round():
	shooping_list.sort()
	current_ingredients.sort()
	if shooping_list == current_ingredients:
		score += 50
		$CanvasLayer/ScoreBoard.update_score(score)
		$PositiveSoundEffect.play()
	else:
		$NegativeSoundEffect.play()

func add_ingredients(indice):
	if current_ingredients.size() < quantity:
		current_ingredients.append(indice)
		$SelectedFruits.assign_fruits(current_ingredients.size()-1,indice)

func asing_shooping_List():
	shooping_list = crate_shooping_list()
	$ShoppingList.assign_fruits(shooping_list)

func crate_shooping_list():
	var rand_shooping_list = []
	for i in range(quantity):
		rand_shooping_list.append(randi_range(0,31))
	return rand_shooping_list

func _on_left_pressed():
	var sectionSize = screen_size.x
	if section > 1:
		$ShoopingZone.position.x += sectionSize
		section -= 1

func _on_rigth_pressed():
	var sectionSize = screen_size.x
	if section < $ShoopingZone.sections:
		$ShoopingZone.position.x -= sectionSize
		section += 1

func _on_shopping_list_start_challenge():
	$ShoppingList.visible = false
	$CanvasLayer/MusicScreen.visible = true
	$MapMusic.play()
	$MusicTimer.start()

func _on_select_timer_timeout():
	if time > 0:
		time -= 1
		$CanvasLayer/ScoreBoard.update_time(time)
	else:
		finish_round()

func _on_clear_pressed():
	current_ingredients.clear()
	$SelectedFruits.reset()

func _on_send_pressed():
	if current_ingredients.size() == quantity:
		check_round()
		finish_round()

func _on_music_timer_timeout():
	$MusicTimer.stop()
	$CanvasLayer/MusicScreen.visible = false
	$CanvasLayer/PauseMenu.visible = true
	$CanvasLayer/StoreButtons.visible = true
	$CanvasLayer/GameButtons.visible = true
	$CanvasLayer/ScoreBoard.visible = true
	$ShoopingZone.visible = true
	$SelectedFruits.visible = true
	$MapMusic.stop()
	$SelectTimer.start()
