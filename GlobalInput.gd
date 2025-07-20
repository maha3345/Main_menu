extends Node
var previous_scene_path: String = ""
var current_scene: Node = null
var last_exit_time := 0.0 #Double press for exit

func _input(event):
	#Go to Main menu on pressing"M" 
	if Input.is_action_just_pressed("go_to_menu"):
		previous_scene_path=get_tree().current_scene.scene_file_path 
		#save current scene path
		get_tree().change_scene_to_file("res://main_menu.tscn")
		
	#Exit game when double press E within 2sec
	elif Input.is_action_just_pressed("exit_game"):
		var current_time= Time.get_ticks_msec()/1000.0
		if current_time - last_exit_time < 2.0:
			get_tree().quit()
		else:
			last_exit_time=current_time
			print("Press again to exit")
	#Optional:Return  to previous scene with R
	elif Input.is_action_just_pressed("return_back"):
		return_to_previous_scene()

func return_to_previous_scene():
	if previous_scene_path != "":
		get_tree().change_scene_to_file(previous_scene_path)
		
		
		
		
	
