extends Node

var time_begin
var time_delay
var spd = 15
var radius = 15
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	time_begin = OS.get_ticks_usec()
	time_delay = AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency()
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time = (OS.get_ticks_usec() - time_begin) / 1000000.0
	self.transform = Transform ( Vector3(1,0,0), Vector3(0,1,0), Vector3(0,0,1),  Vector3(sin(spd*delta*time)*radius,0,cos(spd*time*delta)*radius))
	pass
