extends Node

const MAIN = preload("res://scenes/ui/main/main.tscn")

const LEVELS = {
	1: preload("res://scenes/levels/level_1.tscn"),
	2: preload("res://scenes/levels/level_2.tscn"),
}

var current_level = 0
var enemies_left = 0
var launches = 0


func increment_launches():
	launches += 1


func set_enemies_left(enemies):
	enemies_left = enemies


func decrease_enemies_left():
	enemies_left -= 1
	if enemies_left == 0:
		load_next_level.call_deferred()


func load_next_level():
	current_level += 1
	if current_level <= LEVELS.size():
		get_tree().change_scene_to_packed(LEVELS[current_level])
		launches = 0
	else:
		pass
