extends Control

# Node references (updated paths!)
@onready var music_slider = $CenterContainer/VBoxContainer/MusicSlider
@onready var sfx_toggle = $CenterContainer/VBoxContainer/SFXToggle
@onready var back_button = $CenterContainer/VBoxContainer/BackButton
@onready var hover = $hover




func _ready():
	# Set slider to current master bus volume (linear scale 0–1)
	music_slider.value = db_to_linear(AudioServer.get_bus_volume_db(0))

	# Set checkbox state
	sfx_toggle.button_pressed = GlobalInput.sfx_enabled


	# Connect UI signals
	music_slider.value_changed.connect(_on_music_slider_changed)
	sfx_toggle.toggled.connect(_on_sfx_toggle_toggled)
	back_button.pressed.connect(_on_back_pressed)

# Called when the music slider changes
func _on_music_slider_changed(value):
	# Change volume in real-time
	AudioServer.set_bus_volume_db(0, linear_to_db(value))
	GlobalInput.music_enabled = value > 0.01

	# Save setting to file
	var config = ConfigFile.new()
	config.set_value("audio", "music_enabled", value > 0.01)
	config.save("user://settings.cfg")


# Called when the SFX toggle checkbox is toggled
func _on_sfx_toggle_toggled(pressed):
	GlobalInput.sfx_enabled = pressed
	print("Sound Effects Enabled:", GlobalInput.sfx_enabled)

	# OPTIONAL: Stop or play music based on sfx toggle
	GlobalInput.music_enabled = pressed  # 

	# Also stop music instantly
	if !pressed:
		AudioServer.set_bus_volume_db(0, -80)  # mute
	else:
		AudioServer.set_bus_volume_db(0, linear_to_db(music_slider.value))



# Called when Back button is pressed
func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")  # Change path if needed

func _on_back_button_mouse_entered():
	if GlobalInput.sfx_enabled:
		hover.play()



func _on_sfx_toggle_mouse_entered() -> void:
	if GlobalInput.sfx_enabled:
		hover.play()
