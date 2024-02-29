extends Node2D

@onready var eggScene = load("res://farm/EggGame/Scenes/nest.tscn")
var eggs = []
var buttonsDisable = true
var index = 0
var objetive: int = 20
var points: int  = 0
var eggCounter: int = 0
var time: int = 0

func start():
	$CanvasLayer/Counter.visible = false
	$CanvasLayer/ScoreBoard.visible = true
	$CanvasLayer/PauseMenu.visible = true
	$CanvasLayer/ScoreBoard.set_objetive(objetive)
	for i in range(4):
		generate_nest()
		await get_tree().create_timer(0.67).timeout
	buttonsDisable = false
	set_status_buttons()
	start_timer()

func start_timer():
	$Timer.autostart = true
	$Timer.start()

func stop_timer():
	$Timer.autostart = false
	$Timer.stop()

func generate_nest():
	var egg = eggScene.instantiate()
	egg.create()
	egg.position = Vector2(-130,400)
	eggs.append(egg)
	add_child(egg)
	move_eggs()

func move_eggs():
	for egg in eggs:
		egg.enable_move() 	

func _on_stash_body_entered(body):
	eggs.pop_front()
	body.queue_free()

func set_status_buttons():
	$CanvasLayer/Buttons/Discard.disabled = buttonsDisable
	$CanvasLayer/Buttons/Save.disabled = buttonsDisable

func _on_cooldown_timeout():
	buttonsDisable = false
	set_status_buttons()

func _on_save_pressed():
	if eggs[index].get_isCorrect():
		$PositiveSoundEffect.play_sound()
		points += 10
		eggCounter += 1
		$CanvasLayer/ScoreBoard.update_correct(eggCounter)
	else:
		$NegativeSoundEffect.play_sound()
		points -= 10
	$CanvasLayer/ScoreBoard.update_score(points)
	nest_handler()
	
	if eggCounter == objetive:
		stop()

func stop():
	$CanvasLayer/Buttons.visible = false
	$CanvasLayer/ScoreBoard.visible = false
	$CanvasLayer/PauseMenu.visible = false
	GlobalGames.enableFarmGame = false
	generate_score()
	
func generate_score():
	var percent = (points * 100) / (objetive * 10)
	if percent >= 50:
		GlobalMision.deliver_ingredient("Farm")
	$CanvasLayer/ScoreScreen.result(percent,time)
	$CanvasLayer/ScoreScreen.visible = true

func _on_discard_pressed():
	if eggs[index].get_isCorrect():
		$NegativeSoundEffect.play_sound()
		points -= 10
		$CanvasLayer/ScoreBoard.update_score(points)
	else:
		$PositiveSoundEffect.play_sound()
	nest_handler()

func nest_handler():
	eggs[index].collected()
	generate_nest()
	buttonsDisable = true
	set_status_buttons()
	$Cooldown.start()
	if index != 2:
		index += 1

func _on_timer_timeout():
	time += 1
	$CanvasLayer/ScoreBoard.update_time(time)


func _on_counter_start_game():
	start()
