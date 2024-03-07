extends Node2D

var cows = []
var bushs = []
var nests = []

var cowCoords = [Vector2(360,500),Vector2(540,550),Vector2(720,525)]
var nestCoords = [Vector2(100,260),Vector2(150,360),Vector2(125,460)]
var bushCoords = [Vector2(360,100),Vector2(540,150),Vector2(720,125)]

var countFoodOrdered = 0
var countFoodDelivered = 0
var time = 50
var initial_time = 50

var food = 3
var water = 0
var eggs = 0

func _ready():
	$PlayerSpawner.create_player($CanvasLayer/UI.get_joystick())

func start():
	$CanvasLayer/UI.visible = true
	$CanvasLayer/PauseMenu.visible = true
	$CanvasLayer/Scoreboard.update_time(time)
	create_cows()
	create_bushs()
	create_nest()
	$Timer.start()
	$Timer.autostart = true

func create_cows():
	for i in range(3):
		var cow = preload("res://farm/farmGame/scenes/cow.tscn").instantiate()
		cow.position = cowCoords[i]
		add_child(cow)
		cow.foodDelivered.connect(_on_cow_food_delivered)
		cow.scale = Vector2(0.75,0.75)
		cow.z_index = 2
		cows.append(cow)

func create_bushs():
	for i in range(3):
		var bush = preload("res://farm/farmGame/scenes/bush.tscn").instantiate()
		bush.position = bushCoords[i]
		add_child(bush)
		bush.fruitColeccted.connect(_on_bush_fruit_collected)
		bush.scale = Vector2(0.75,0.75)
		bush.z_index = 2
		bushs.append(bush)

func create_nest():
	for i in range(3):
		var nest = preload("res://farm/farmGame/scenes/nest.tscn").instantiate()
		nest.position = nestCoords[i]
		add_child(nest)
		nest.eggColeccted.connect(_on_nest_egg_collected)
		nest.scale = Vector2(0.75,0.75)
		nest.z_index = 2
		nests.append(nest)

func _on_nest_egg_collected(done):
	if done:
		$PositiveSoundEffect.play_sound()
		countFoodDelivered += 1
		eggs += 1
		$CanvasLayer/Scoreboard.update_deliver(countFoodDelivered)
		$CanvasLayer/Scoreboard.update_eggs(eggs)
	else:
		$NegativeSoundEffect.play_sound()

func _on_bush_fruit_collected(done):
	if done:
		$PositiveSoundEffect.play_sound()
		countFoodDelivered += 1
		water -= 1
		$CanvasLayer/Scoreboard.update_deliver(countFoodDelivered)
		$CanvasLayer/Scoreboard.update_water(water)
	else:
		$NegativeSoundEffect.play_sound()

func _on_cow_food_delivered(done):
	if done:
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
	if time % 2 == 0:
		assign_order()
	update_time()
	

func assign_order():
	if time <= 5: return;
	var number = randi_range(0,2)
	if number == 0:
		var cow = cows[randi_range(0,2)]
		if not cow.done: return;
		cow.order_food()
		add_Order()
	elif number == 1:
		var bush = bushs[randi_range(0,2)]
		if not bush.done: return;
		bush.order_food()
		add_Order()
	else:
		var nest = nests[randi_range(0,2)]
		if not nest.done: return;
		nest.order_food()
		add_Order()

func add_Order():
	countFoodOrdered += 1
	$OrderSound.play()
	$CanvasLayer/Scoreboard.update_request(countFoodOrdered)

func update_time():
	time -= 1
	$CanvasLayer/Scoreboard.update_time(time)
	if time <= 0:
		stop_game()

func _on_cow_feed_center_body_entered(body):
	if body.get_name().contains("Player") and food < 3:
		$NeutralSoundEffect.play_sound()
		food = 3
		water = 0
		$CanvasLayer/Scoreboard.update_cow_feed(food)
		$CanvasLayer/Scoreboard.update_water(water)

func _on_water_center_body_entered(body):
	if body.get_name().contains("Player") and water < 3:
		$NeutralSoundEffect.play_sound()
		water = 3
		food = 0
		$CanvasLayer/Scoreboard.update_cow_feed(food)
		$CanvasLayer/Scoreboard.update_water(water)

func _on_egg_center_body_entered(body):
	if body.get_name().contains("Player") and eggs > 0:
		$NeutralSoundEffect.play_sound()
		eggs = 0
		$CanvasLayer/Scoreboard.update_eggs(eggs)

func _on_counter_start_game():
	$CanvasLayer/Scoreboard.visible = true
	$CanvasLayer/Counter.visible = false
	start()
