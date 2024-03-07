extends Control

@export() var texture:Texture
@export() var spriteScale = Vector2(1,1)
@export() var hframes = 1
@export() var vframes = 1

func _ready():
	$Sprite2D.texture = texture
	$Sprite2D.scale = spriteScale
	$Sprite2D.hframes = hframes
	$Sprite2D.vframes = vframes
