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

func _ready():
	$PlayerSpawner.create_player($CanvasLayer/UI.get_joystick())

func start():
	$CanvasLayer/UI.visible = true
	$CanvasLayer/PauseMenu.visible = true
	$CanvasLayer/Scoreboard.update_time(time)
	create_cows()
	$Timer.start()
	$Timer.autostart = true

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
		$PositiveSoundEffect.play_sound()
		countFoodDelivered += 1
		food -= 1
		$CanvasLayer/Scoreboard.update_deliver(countFoodDelivered)
		$CanvasLayer/Scoreboard.update_cow_feed(food)
	else:
		$NegativeSoundEffect.play_sound()
	

func stop_game():
	$Timer.autostart = false
	$Timer.stop()
	$CanvasLayer/Scoreboard.visible = false
	$CanvasLayer/UI.visible = false
	$CanvasLayer/PauseMenu.visible = false
	GlobalGames.enableFarmGame = false
	var percent = (countFoodDelivered * 100)/countFoodOrdered
	$CanvasLayer/ScoreScreen.result(percent, initial_time)
	if percent >= 50:
		GlobalMision.deliver_ingredient("Farm")
	$CanvasLayer/ScoreScreen.visible = true

func _on_timer_timeout():
	assign_cow_order()
	update_time()

func assign_cow_order():
	var number = randi_range(0,1)
	var cow = cows[randi_range(0,cows.size()-1)]
	if number and cow.done and time > 5:
		countFoodOrdered += 1
		cow.order_food()
		$CanvasLayer/Scoreboard.update_request(countFoodOrdered)

func update_time():
	time -= 1
	$CanvasLayer/Scoreboard.update_time(time)
	if time <= 0:
		stop_game()

func _on_cow_feed_center_body_entered(body):
	if body.get_name().contains("Player") and food < 4:
		$NeutralSoundEffect.play_sound()
		food = 4
		$CanvasLayer/Scoreboard.update_cow_feed(food)

func _on_counter_start_game():
	$CanvasLayer/Scoreboard.visible = true
	$CanvasLayer/Counter.visible = false
	start()
