extends Control

@onready var launches_label: Label = $MarginContainer/LaunchesLabel
@onready var level_completed_label: Label = $MarginContainer/LevelCompletedLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalManager.player_launched.connect(_on_player_launched)
	SignalManager.level_completed.connect(_on_level_completed)


func _on_player_launched():
	#launcheslabel.text = "Launches: %d" % GameManager.launches
	launches_label.text = "Launches: " + str(GameManager.launches)


func _on_level_completed():
	level_completed_label.visible = true
#	GameManager.load_next_level.call_deferred()
