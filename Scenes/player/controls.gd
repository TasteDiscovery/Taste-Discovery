extends CanvasLayer

signal a_pressed


func _on_a_pressed():
	emit_signal("a_pressed")
