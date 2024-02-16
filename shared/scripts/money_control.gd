extends Control

func _ready():
	$Panel/MoneyLabel.text = "%04d" % GlobalPlayer.moneys
