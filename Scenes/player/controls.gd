extends CanvasLayer

signal a_pressed

func _on_a_pressed():
	if PRINCIPAL_GLOBAL.can_move:
		emit_signal("a_pressed")
