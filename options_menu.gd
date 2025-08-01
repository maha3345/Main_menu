extends Control


@onready var music_slider = $CenterContainer/VBoxContainer/MusicSlider
@onready var sfx_toggle = $CenterContainer/VBoxContainer/SFXToggle
@onready var back_button = $CenterContainer/VBoxContainer/BackButton
@onready var hover = $hover
@onready var music_player = $Mainmenumusic





func _ready():
	
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(0))

	
	sfx_toggle.button_pressed = GlobalInput.sfx_enabled
	
	
	if GlobalInput.music_enabled:
		music_player.play()
	else:
		music_player.stop()


	
	music_slider.value_changed.connect(_on_music_slider_changed)
	sfx_toggle.toggled.connect(_on_sfx_toggle_toggled)
	back_button.pressed.connect(_on_back_pressed)


func _on_music_slider_changed(value):
	
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	GlobalInput.music_enabled = value > 0.01

	
	var config = ConfigFile.new()
	config.set_value("audio", "music_enabled", value > 0.01)
	config.save("user://settings.cfg")



func _on_sfx_toggle_toggled(pressed):
	GlobalInput.sfx_enabled = pressed
	print("Sound Effects Enabled:", GlobalInput.sfx_enabled)

	
	GlobalInput.music_enabled = pressed  # 

	
	if !pressed:
		AudioServer.set_bus_volume_db(0, -80)  # mute
	else:
		AudioServer.set_bus_volume_db(0, linear_to_db(music_slider.value))




func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn") 

func _on_back_button_mouse_entered():
	if GlobalInput.sfx_enabled:
		hover.play()



func _on_sfx_toggle_mouse_entered() -> void:
	if GlobalInput.sfx_enabled:
		hover.play()
