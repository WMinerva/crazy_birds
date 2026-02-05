extends Node

const MAIN = preload("res://scenes/ui/main/main.tscn")

const SCORE_SCREEN = preload("uid://dtnevjhxso1qy")

const LEVELS = {
	1: preload("res://scenes/levels/level_1.tscn"),
	2: preload("res://scenes/levels/level_2.tscn"),
}

var current_level = 0
var enemies_left = 0
var launches = 0
var levels_launches = {}


func add_levels_launches():
	levels_launches[current_level] = launches


func increment_launches():
	launches += 1


func set_enemies_left(enemies):
	enemies_left = enemies


func decrease_enemies_left():
	enemies_left -= 1
	if enemies_left == 0:
		add_levels_launches()
		#load_next_level.call_deferred()
		SignalManager.level_completed.emit()


func load_next_level():
	current_level += 1
	if current_level <= LEVELS.size():
		get_tree().change_scene_to_packed(LEVELS[current_level])
		launches = 0
	else:
		get_tree().change_scene_to_packed(SCORE_SCREEN)


func reset_game():
	get_tree().change_scene_to_packed(MAIN)
	current_level = 0
	launches = 0
