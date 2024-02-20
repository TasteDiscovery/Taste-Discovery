extends Node2D

var correctApples: int
var fakeApples: int
var applesObjetive: int

var applesCollected = 0
var correctApplesCollected = 0

var time = 0

func _ready():
	$PlayerSpawner.create_player($CanvasLayer/UI.get_joystick())

func start():
	set_difficulty()
	$CanvasLayer/ScoreBoard.set_objetive(applesObjetive)
	var correct_indice = randf_range(0,8)
	generate_apples(correct_indice)
	$CanvasLayer/ScoreBoard.set_objetive_sprite(correct_indice)
	$CanvasLayer/PauseMenu.visible = false
	$CanvasLayer/ScoreBoard.visible = true
	$CanvasLayer/Counter.visible = false
	$CanvasLayer/UI.visible = true
	start_timer()

func set_difficulty():
	correctApples = 8
	fakeApples = 20
	applesObjetive = 8

func start_timer():
	$Timer.start()
	$Timer.autostart = true
	
func generate_apples(correctIndice):
	var spawners = [$AppleSpawner,$AppleSpawner2,$AppleSpawner3,$AppleSpawner4]
	for spawn in spawners:
		spawn.correctIndice = correctIndice
		spawn.fakeQuantity = fakeApples/spawners.size()
		spawn.correctQuantity = correctApples/spawners.size()
		spawn.generate()

func apple_collected(isCorrect:bool):
	if isCorrect:
		$PositiveSoundEffect.play_sound()
		correctApplesCollected += 1
		$CanvasLayer/ScoreBoard.update_correct(correctApplesCollected)
		applesCollected += 1
	else:
		$NegativeSoundEffect.play_sound()
		applesCollected += 3
	
	if correctApplesCollected >=applesObjetive: 
		stop_game()

func _on_timer_timeout():
	time += 1
	$CanvasLayer/ScoreBoard.update_time(time)
	
func stop_game():
	$CanvasLayer/UI.visible = false
	$Timer.autostart = false
	$Timer.stop()
	$CanvasLayer/ScoreBoard.visible = false
	$CanvasLayer/UI.visible = false
	$CanvasLayer/PauseMenu.visible = false
	GlobalGames.enableForestGame = false
	var percent = (correctApplesCollected * 100) / applesCollected
	if percent >= 50:
		GlobalMision.deliver_ingredient("Forest")
	
	$CanvasLayer/ScoreScreen.result(percent,time)
	$CanvasLayer/ScoreScreen.visible = true

func _on_counter_start_game():
	start()
