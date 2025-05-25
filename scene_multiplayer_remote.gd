extends Node2D

func _ready() -> void:
	print('initializing network...')
	var m = get_tree().get_multiplayer()


func _on_button_pressed() -> void:
	var singletonScene = get_tree().get_nodes_in_group('singleton')[0]
	singletonScene.play_exit()

	get_tree().change_scene_to_file('res://main_menu.tscn')
