extends CheckButton

@export var bus_name:String
var bus_index:int

func _ready():
	bus_index = AudioServer.get_bus_index(bus_name)
	button_pressed = not AudioServer.is_bus_mute(bus_index)

func _on_toggled(toggled_on):
	AudioServer.set_bus_mute(bus_index, not toggled_on)
