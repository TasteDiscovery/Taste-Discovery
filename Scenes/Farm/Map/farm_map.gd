extends Node2D

@onready var cow_scene = preload("res://Scenes/Farm/NPC/Cow.tscn")

var cows = []
var coords = [Vector2(180,-400),
	Vector2(360,-500),Vector2(540,-550),
	Vector2(720,-525),Vector2(630,-350),
	Vector2(675,-150),Vector2(360,-300),
	Vector2(360,-100),Vector2(900,-200)]
	
var countFoodOrdered = 0
var countFoodDelivered = 0
var score = 0
var time = 50
var food = 4

@onready var hungryTimer = $HungryTimer
@onready var timerLimit = $TimerLimit
@onready var scoreboard = $CanvasLayer/ScoreBoard
	
func _ready():
	create_cows()
	randomize()
	start_game()

func start_game():
	scoreboard.update_time(time)
	hungryTimer.autostart = true
	timerLimit.autostart = true
	hungryTimer.start()
	timerLimit.start()
	scoreboard.visible = true

func create_cows():
	for i in range(8):
		var cow = cow_scene.instantiate()
		cow.position = coords[i]
		add_child(cow)
		cow.foodDelivered.connect(_on_cow_food_delivered)
		cow.scale = Vector2(0.75,0.75)
		cows.append(cow)

func _on_cow_food_delivered(delivered):
	if delivered:
		countFoodDelivered += 1
		score += 100
		food -= 1
	else:
		score -= 20
	scoreboard.update_score(score)

func stop_game():
	hungryTimer.autostart = false
	timerLimit.autostart = false
	hungryTimer.stop()
	timerLimit.stop()
	scoreboard.visible = false

func _on_hungry_timer_timeout():
	var number = randi_range(0,1)
	var cow = cows[randi_range(0,cows.size()-1)]
	if number and cow.done:
		countFoodOrdered += 1
		cow.order_food()

func _on_timer_limit_timeout():
	time -= 1
	scoreboard.update_time(time)
	if time <= 0:
		stop_game()

func _on_basic_cow_feed_center_body_entered(body):
	if body.get_name() == 'player':
		food = 4
