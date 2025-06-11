extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_button_pressed() -> void:
	$ClickPlayer.play()
	await $ClickPlayer.finished  # Wait until sound ends
	get_tree().change_scene_to_file("res://emptyscene1.tscn")# Replace with function body.


func _on_button_2_pressed() -> void:
	$ClickPlayer.play()
	await $ClickPlayer.finished  # Wait until sound ends
	print("options") # Replace with function body.


func _on_button_3_pressed() -> void:
	$ClickPlayer.play()
	await $ClickPlayer.finished  # Wait until sound ends
	get_tree().quit() # Replace with function body.
	
