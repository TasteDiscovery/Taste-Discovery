extends Node2D

var cows = []
var coords = [Vector2(180,400),
	Vector2(360,500),Vector2(540,550),
	Vector2(720,525),Vector2(630,350),
	Vector2(675,150),Vector2(360,300),
	Vector2(360,100),Vector2(900,200)]

var countFoodOrdered = 0
var countFoodDelivered = 0
var time = 50
var initial_time = 50
var food = 4

@onready var playerSpawner = $PlayerSpawner
@onready var ui = $CanvasLayer/UI

@onready  var scoreBoard = $CanvasLayer/Scoreboard
@onready var counter = $CanvasLayer/Counter
@onready var scoreScreen = $CanvasLayer/ScoreScreen
@onready var timer = $Timer

func _ready():
	playerSpawner.create_player(ui.get_joystick())
	randomize()

func start():
	scoreBoard.update_time(time)
	create_cows()
	timer.start()
	timer.autostart = true

func create_cows():
	for i in range(8):
		var cow = preload("res://farm/cowGame/scenes/cow.tscn").instantiate()
		cow.position = coords[i]
		add_child(cow)
		cow.foodDelivered.connect(_on_cow_food_delivered)
		cow.scale = Vector2(0.75,0.75)
		cow.z_index = 2
		cows.append(cow)

func _on_cow_food_delivered(delivered):
	if delivered:
		countFoodDelivered += 1
		food -= 1
		scoreBoard.update_deliver(countFoodDelivered)
		scoreBoard.update_cow_feed(food)
	

func stop_game():
	timer.autostart = false
	timer.stop()
	scoreBoard.visible = false
	GlobalGames.enableFarmGame = false
	var percent = (countFoodDelivered * 100)/countFoodOrdered
	scoreScreen.result(percent, initial_time)
	if percent >= 50:
		GlobalMision.deliver_ingredient("Farm")
	scoreScreen.visible = true

func _on_timer_timeout():
	assign_cow_order()
	update_time()

func assign_cow_order():
	var number = randi_range(0,1)
	var cow = cows[randi_range(0,cows.size()-1)]
	if number and cow.done:
		countFoodOrdered += 1
		cow.order_food()
		scoreBoard.update_request(countFoodOrdered)

func update_time():
	time -= 1
	scoreBoard.update_time(time)
	if time <= 0:
		stop_game()

func _on_cow_feed_center_body_entered(body):
	if body.get_name().contains("Player"):
		food = 4
		scoreBoard.update_cow_feed(food)

func _on_counter_start_game():
	scoreBoard.visible = true
	counter.visible = false
	start()
