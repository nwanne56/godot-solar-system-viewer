extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = self
	button.connect("pressed", self, "_button_pressed")
	pass # Replace with function body.


func _button_pressed():
	get_tree().reload_current_scene()
