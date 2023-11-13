extends Area2D

@export_file('*.tscn') var change_scene

func _on_body_entered(body):
	if(body.name == 'player'):
		get_tree().change_scene_to_file(change_scene)
	pass
