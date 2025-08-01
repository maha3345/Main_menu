extends Control

@onready var music_player = $Mainmenumusic  

func _ready():
	$VBoxContainer.get_child(0).grab_focus()

	if GlobalInput.music_enabled:
		music_player.play()
	else:
		music_player.stop()


func _on_button_pressed() -> void:
	$ClickPlayer.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://emptyscene1.tscn")

func _on_button_2_pressed() -> void:
	$ClickPlayer.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://options_menu.tscn")

func _on_button_3_pressed() -> void:
	$ClickPlayer.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()

func _on_button_mouse_entered() -> void:
	if GlobalInput.sfx_enabled:
		$hover.play()


func _on_button_2_mouse_entered() -> void:
	if GlobalInput.sfx_enabled:
		$hover.play()


func _on_button_3_mouse_entered() -> void:
	if GlobalInput.sfx_enabled:
		$hover.play()
