extends Node

@onready var pause_panel = $Panel
@onready var music_player = $Mainmenumusic
@onready var hover = $hover
@onready var click_player = $ClickPlayer

@onready var button_resume = $Panel/Button
@onready var button_mainmenu = $Panel/Button2
@onready var button_exit = $Panel/Button3


func _ready() -> void:
	# Start with pause panel hidden
	pause_panel.visible = false
	
	# Play music if enabled
	if GlobalInput.music_enabled:
		music_player.play()
	else:
		music_player.stop()
	
	# Connect button signals
	button_resume.pressed.connect(_on_continue)
	button_mainmenu.pressed.connect(_on_main)
	button_exit.pressed.connect(_on_exit)
	
	# Connect hover sounds for buttons
	button_resume.mouse_entered.connect(_on_hover)
	button_mainmenu.mouse_entered.connect(_on_hover)
	button_exit.mouse_entered.connect(_on_hover)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):  # ESC key
		pause_panel.visible = true


func _on_continue() -> void:
	click_player.play()
	await get_tree().create_timer(0.3).timeout
	pause_panel.visible = false

func _on_main() -> void:
	click_player.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_exit() -> void:
	click_player.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().quit()

func _on_hover() -> void:
	if GlobalInput.sfx_enabled:
		hover.play()
