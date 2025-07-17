extends Node


func	_input(event):
	#Go to Main menu on pressing"M" 
	if Input.is_action_just_pressed("go_to_menu"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
		
	#Exit game when pressing Escape or mobile back button
	elif Input.is_action_just_pressed("exit_game"):
		get_tree().quit()
		
		
		
	
