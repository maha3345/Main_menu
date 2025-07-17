extends AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
var loop_point = 24.6
func _ready():
	play()
func _process(delta):
	if get_playback_position()>=loop_point:
		seek(0.0)
	
	
	
