extends Button

func _on_pressed() -> void:
	var singletonScene = get_tree().get_nodes_in_group('singleton')[0]
	singletonScene.play_start()

	get_tree().change_scene_to_file('res://scene_credits.tscn')
