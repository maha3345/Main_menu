extends Node
#extends Button
#
#
#@onready var my_panel = get_parent()
#@onready var music_player = get_node("../../Mainmenumusic")
#@onready var hover = get_node("../../hover")
#
#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#my_panel.visible = false
#
	#if GlobalInput.music_enabled:
		#music_player.play()
	#else:
		#music_player.stop()
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("ui_cancel"):  # ui_cancel is mapped to ESC by default
		#my_panel.visible = true
	#
#func on_main():
	#$ClickPlayer.play()
	#await get_tree().create_timer(0.3).timeout
	#get_tree().change_scene_to_file("res://main_menu.tscn")
	#
#func on_exit():
	#$ClickPlayer.play()
	#await get_tree().create_timer(0.3).timeout
	#get_tree().quit()
	#
#func on_continue():
	#$ClickPlayer.play()
	#await get_tree().create_timer(0.3).timeout
	#my_panel.visible = false
	#
#
#
#func _on_mouse_entered() -> void:
	#if GlobalInput.sfx_enabled:
		#get_node("../../hover").play()
#
#
#func _on_button_2_mouse_entered() -> void:
	#if GlobalInput.sfx_enabled:
		#get_node("../../hover").play()
#
#
#func _on_button_3_mouse_entered() -> void:
	#if GlobalInput.sfx_enabled:
		#get_node("../../hover").play()
