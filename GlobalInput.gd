extends Node

var music_enabled := true
var sfx_enabled := true

func _input(event):
	if Input.is_action_just_pressed("go_to_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
	elif Input.is_action_just_pressed("exit_game"):
		get_tree().quit()
