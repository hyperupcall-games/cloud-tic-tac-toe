extends Button


func _ready() -> void:
	add_to_group('squares')

func _on_pressed() -> void:
	var game_scene = get_tree().get_nodes_in_group('game_scene')

	if game_scene[0].get_current_turn() == '':
		return

	if !game_scene[0].is_multiplayer():
		game_scene[0].set_current_turn('player1')
		if self.text == '':
			self.text = 'O'
			game_scene[0].switchTurn()
		game_scene[0].show_status()
		return

	if game_scene[0].get_current_turn() == 'player1':
		if self.text == '':
			self.text = 'O'
			game_scene[0].switchTurn()
	elif game_scene[0].get_current_turn() == 'player2':
		if self.text == '':
			self.text = 'X'
			game_scene[0].switchTurn()

		
	game_scene[0].show_status()
