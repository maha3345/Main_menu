extends Button


@onready var my_panel = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	my_panel.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):  # ui_cancel is mapped to ESC by default
		my_panel.visible = true
	

func on_main():
	get_tree().change_scene_to_file("res://main_menu.tscn")
	
func on_exit():
	get_tree().quit()
	
func on_continue():
	my_panel.visible = false
	
