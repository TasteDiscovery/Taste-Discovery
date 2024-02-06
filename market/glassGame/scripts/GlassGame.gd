extends Node2D

enum {
	START,
	SHUFFLE,
	MOVE,
	SELECT
}
var currentState = START
var score = 0
var maxRound = 3
var roundCount = 1
var mixNumber = 5
var mixCount = 0

var counter = 3

@onready var glasses = $Glasses

func start():
	select_dificulty()
	glasses.load_glasses()
	glasses.set_glass_with_ball()
	$CanvasLayer/Scoreboard.update_round(roundCount)
	
	glasses.show_ball()
	await (get_tree().create_timer(2).timeout)
	currentState = SHUFFLE

func select_dificulty():
	maxRound = 3
	mixNumber = 5
	glasses.glassNumber = 3

func _process(delta):
	match currentState:
		SHUFFLE:
			mix_glasses()
		MOVE:
			move()

func enable_press():
	glasses.enable_press()

func move():
	glasses.move()
	if glasses.arrived():
		currentState = SHUFFLE

func mix_glasses():
	if mixCount < mixNumber:
		glasses.choose_glasses()
		if glasses.chosen_glasses():
			currentState = MOVE
			mixCount += 1
	else:
		enable_press()
		currentState = SELECT

func _on_glasses_selection(hasBall):
	calculate_score(hasBall)
	glasses.disable_press()
	glasses.show_ball()
	await (get_tree().create_timer(2).timeout)
	next_or_finish()

func calculate_score(hasBall):
	if hasBall: 
		score += 1
		$CanvasLayer/Scoreboard.update_score(score)

func next_or_finish():
	roundCount += 1
	if roundCount <= maxRound:
		mixCount = 0
		$CanvasLayer/Scoreboard.update_round(roundCount)
		currentState = SHUFFLE
	else:
		roundCount -= 1
		finish()

func finish():
	GlobalGames.enableMarketGame = false
	$CanvasLayer/Scoreboard.visible = false
	var percent = (score * 100)/roundCount
	$CanvasLayer/ScoreScreen.result(percent, 0)
	if percent >= 50:
		GlobalMision.deliver_ingredient("Market")
	$CanvasLayer/ScoreScreen.visible = true


func _on_counter_start_game():
	$CanvasLayer/Scoreboard.visible = true
	$CanvasLayer/Counter.visible = false
	start()
