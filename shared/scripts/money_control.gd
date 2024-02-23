extends Control

func _ready():
	update_value()

func update_value():
	$Panel/MoneyLabel.text = "%04d" % GlobalPlayer.moneys
