#extends "res://scene_multiplayer.gd"
extends Node2D

var currentTurn = 'player1'
var player1Name = 'Player'
var player2Name = 'Bot'

func _ready():
	add_to_group('game_scene')

func is_multiplayer():
	return false
	
func show_status():
	var singleton = get_tree().get_nodes_in_group('singleton')[0]
	var s = is_solved()
	if s == 'O':
		singleton.play_happy()
		get_node('SolveStatus').text = 'You won!'
	elif s == 'X':
		singleton.play_sad()
		get_node('SolveStatus').text = 'You lost!'
		currentTurn = ''
	elif is_cats_game():
		singleton.play_sad()
		get_node('SolveStatus').text = 'Cat\'s Game :('
		currentTurn = ''

func get_current_turn():
	return currentTurn

func set_current_turn(value):
	currentTurn = value

func switchTurn():
	var notFilled = []
	var squares = get_tree().get_nodes_in_group('squares')
	var i = 0;
	for square in squares:
		if square.text == '':
			notFilled.append(i)
		i += 1;
		
	if notFilled.size() == 0:
		show_status()
		return
	
	currentTurn = 'player2'
	var randomNum = randi() % notFilled.size()
	squares[notFilled[randomNum]].text = 'X'

func is_solved():
	var squares = get_tree().get_nodes_in_group('squares')
	
	# Order either undefined or depends on order of nodes in the scene.
	
	# Rows
	if is_row_solved(squares[0].text, squares[1].text, squares[2].text):
		return squares[0].text
	if is_row_solved(squares[3].text, squares[4].text, squares[5].text):
		return squares[3].text
	if is_row_solved(squares[6].text, squares[7].text, squares[8].text):
		return squares[6].text
	
	# Columns
	if is_row_solved(squares[0].text, squares[3].text, squares[6].text):
		return squares[0].text
	if is_row_solved(squares[1].text, squares[4].text, squares[7].text):
		return squares[1].text
	if is_row_solved(squares[2].text, squares[5].text, squares[8].text):
		return squares[2].text
	
	# Diagonals
	if is_row_solved(squares[0].text, squares[4].text, squares[8].text):
		return squares[0].text
	if is_row_solved(squares[2].text, squares[4].text, squares[6].text):
		return squares[2].text

func is_cats_game():
	var squares = get_tree().get_nodes_in_group('squares')
	var is_cats_game = true
	for square in squares:
		if square.text == '':
			is_cats_game = false
	
	return is_cats_game

func is_row_solved(val1, val2, val3):
	return val1 == val2 && val1 == val3 && val1 != ''


func _on_back_pressed() -> void:
	var singletonScene = get_tree().get_nodes_in_group('singleton')[0]
	singletonScene.play_exit()

	get_tree().change_scene_to_file('res://main_menu.tscn')
