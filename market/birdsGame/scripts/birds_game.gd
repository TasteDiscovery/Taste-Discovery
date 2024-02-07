extends Node2D

var birdsCounter = 0
var correctBirdsCounter = 0
var objective = 10
var time = 0

func start():
	$CanvasLayer/Counter.visible = false
	$CanvasLayer/ScoreBoard.visible = true
	$CanvasLayer/ScoreBoard.set_objetive_birds(objective)
	start_time()
	$Spawner.start()

func stop():
	$CanvasLayer/ScoreBoard.visible = false
	$Spawner.stop()	
	stop_time()
	GlobalGames.enableMarketGame = false
	var percent = (correctBirdsCounter * 100) / birdsCounter
	if percent >= 50:
		GlobalMision.deliver_ingredient("Market")
	$CanvasLayer/ScoreScreen.visible = true
	$CanvasLayer/ScoreScreen.result(percent,time)
	$CanvasLayer/ScoreScreen.visible = true

func stop_time():
	$Timer.autostart = false
	$Timer.stop()

func start_time():
	$Timer.autostart = true
	$Timer.start()

func _on_stash_body_entered(body):
		body.queue_free()

func _on_counter_start_game():
	start()

func on_bird_capture(isCorrect):
	if isCorrect:
		birdsCounter +=1
		correctBirdsCounter += 1
		$CanvasLayer/ScoreBoard.update_correct_bird(correctBirdsCounter)
		if correctBirdsCounter >= objective:
			stop()
	else:
		birdsCounter += 1

func _on_timer_timeout():
	time += 1
	$CanvasLayer/ScoreBoard.update_time(time)
