extends Camera2D

var player
var start_position = Vector2(960, 540)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if player == null:
		return
	# if not player:
	# 	return
	if player.position.x > position.x:
		position.x = player.position.x


func _on_player_spawner_player_spawned(player_instance: Variant) -> void:
	player = player_instance
	position = start_position
