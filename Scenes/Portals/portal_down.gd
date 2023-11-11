extends Area2D

@export var sceneName: String
@export var sceneDirName: String


func _on_body_entered(body):
	if(body.name == 'player'):
		get_tree().change_scene_to_file("res://Scenes/"+sceneDirName +"/"+ sceneName+".tscn")
	pass
