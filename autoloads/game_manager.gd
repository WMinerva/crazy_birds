extends Node

const MAIN = preload("res://scenes/ui/main/main.tscn")

const LEVELS = {
	1: preload("res://scenes/levels/level_1.tscn"),
	2: preload("res://scenes/levels/level_2.tscn"),
}

var current_level = 0


func load_next_level():
	current_level += 1
	get_tree().change_scene_to_packed(LEVELS[current_level])
