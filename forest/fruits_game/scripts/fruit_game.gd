extends Node2D

var correctFruits: int
var fakeFruits: int
var fruitsObjetive: int

var fruitsCollected = 0
var correctfruitsCollected = 0

var time = 0

func _ready():
	$PlayerSpawner.create_player($CanvasLayer/UI.get_joystick())

func start():
	set_difficulty()
	$CanvasLayer/ScoreBoard.set_objetive(fruitsObjetive)
	var correct_indice = randf_range(0,15)
	generate(correct_indice)
	$CanvasLayer/ScoreBoard.set_required(correct_indice)
	$CanvasLayer/ScoreBoard.visible = true
	$CanvasLayer/Counter.visible = false
	start_timer()

func set_difficulty():
	correctFruits = 12
	fakeFruits = 12
	fruitsObjetive = 10	

func start_timer():
	$Timer.start()
	$Timer.autostart = true
	
func generate(correctIndice:int):
	var spawners = [$FruitSpawner,$FruitSpawner2,$FruitSpawner3,$FruitSpawner4]
	for spawn in spawners:
		spawn.correctIndice = correctIndice
		spawn.fakeQuantity = fakeFruits/spawners.size()
		spawn.correctQuantity = correctFruits/spawners.size()
		spawn.generate()

func collected(isCorrect:bool):
	if isCorrect:
		correctfruitsCollected += 1
		$CanvasLayer/ScoreBoard.update_correct(correctfruitsCollected)
	fruitsCollected += 1
	
	if correctfruitsCollected >= fruitsObjetive: 
		stop_game()

func _on_timer_timeout():
	time += 1
	$CanvasLayer/ScoreBoard.update_time(time)
	
func stop_game():
	$Timer.autostart = false
	$Timer.stop()
	$CanvasLayer/ScoreBoard.visible = false
	GlobalGames.enableForestGame = false
	var percent = (correctfruitsCollected * 100) / fruitsCollected
	if percent >= 50:
		GlobalMision.deliver_ingredient("Forest")
	$CanvasLayer/ScoreScreen.visible = true
	
	$CanvasLayer/ScoreScreen.result(percent,time)
	$CanvasLayer/ScoreScreen.visible = true

func _on_counter_start_game():
	start()
