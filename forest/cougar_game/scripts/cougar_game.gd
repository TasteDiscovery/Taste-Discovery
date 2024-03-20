extends Node2D

var correctFruits: int
var fakeFruits: int
var fruitsObjetive: int

var fruitsCollected = 0
var correctfruitsCollected = 0

var time = 0
var foxTime = 0
var enableFox = false
var foxCoolDown : int
var player: Node2D
var inGame = false

func _ready():
	player = $PlayerSpawner.create_player($CanvasLayer/UI.get_joystick())
	player.connect("moving",enable_chase)
	foxCoolDown =get_fox_cool_down()
	foxTime = 3
	$Cougar.player = player

func get_fox_cool_down()->int:
	return randi_range(5,8)

func start():
	set_difficulty()
	$CanvasLayer/UI.visible = true
	$CanvasLayer/ScoreBoard.set_objetive(fruitsObjetive)
	var correct_indice = randf_range(0,15)
	generate(correct_indice)
	$CanvasLayer/ScoreBoard.set_required(correct_indice)
	$CanvasLayer/PauseMenu.visible = true
	$CanvasLayer/ScoreBoard.visible = true
	$CanvasLayer/Counter.visible = false
	start_timer()
	inGame = true

func set_difficulty():
	correctFruits = 8
	fakeFruits = 20
	fruitsObjetive = 8	

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
		$PositiveSoundEffect.play_sound()
		correctfruitsCollected += 1
		$CanvasLayer/ScoreBoard.update_correct(correctfruitsCollected)
		fruitsCollected += 1
	else:
		$NegativeSoundEffect.play_sound()
		fruitsCollected += 3
	
	if correctfruitsCollected >= fruitsObjetive: 
		stop_game()

func _on_timer_timeout():
	increment_time()
	fox_manager()

func increment_time():
	time += 1
	$CanvasLayer/ScoreBoard.update_time(time)
	
func stop_game():
	inGame = false
	$Timer.autostart = false
	$Timer.stop()
	$CanvasLayer/ScoreBoard.visible = false
	$CanvasLayer/UI.visible = false
	$CanvasLayer/PauseMenu. visible = false
	GlobalGames.enableForestGame = false
	var percent = get_percent()
	if percent >= 50:
		GlobalMision.deliver_ingredient("Forest")
	$CanvasLayer/ScoreScreen.visible = true
	$CanvasLayer/ScoreScreen.result(percent,time)
	$CanvasLayer/ScoreScreen.visible = true

func get_percent()->float:
	var percent = 0
	if fruitsCollected != 0:
		percent = (correctfruitsCollected * 100) / fruitsCollected
	return percent

func _on_counter_start_game():
	start()

func fox_manager():
	if not  enableFox and time == foxCoolDown - 1:
		prepare_attack()
	elif not enableFox and time == foxCoolDown:
		start_atack()
	elif enableFox and foxTime > 0:
		foxTime -= 1
	elif foxTime <= 0:
		stop_atack()

func prepare_attack():
	var offset_x = 100
	var offset_y = 50
	
	if player.position.x > 1152: offset_x = -100
	if player.position.y > 648: offset_x = -50

	$Cougar.position.x = player.position.x + offset_x
	$Cougar.position.y = player.position.y + offset_y
	$Cougar.roar()
	$Cougar.visible = true

func start_atack():
	enableFox = true
	
func enable_chase():
	if enableFox and not $Cougar.is_chasing():
		$Cougar.enable_chase()

func stop_atack():
	$Cougar.disable_chase()
	$Cougar.visible = false
	enableFox = false
	foxCoolDown = time + get_fox_cool_down()
	foxTime = 3

func _on_cougar_trapped_player():
	if inGame:
		correctfruitsCollected = 0
		stop_game()
